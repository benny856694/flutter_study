// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

class Device {
  final String mac;
  final String ip;
  final String platform;
  final String system;
  final String mask;
  Device({
    required this.mac,
    required this.ip,
    required this.platform,
    required this.system,
    required this.mask,
  });

  Device copyWith({
    String? mac,
    String? ip,
    String? platform,
    String? system,
    String? mask,
  }) {
    return Device(
      mac: mac ?? this.mac,
      ip: ip ?? this.ip,
      platform: platform ?? this.platform,
      system: system ?? this.system,
      mask: mask ?? this.mask,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mac': mac,
      'ip': ip,
      'platform': platform,
      'system': system,
      'mask': mask,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      mac: map['mac'] as String,
      ip: map['ip'] as String,
      platform: map['platform'] as String,
      system: map['system'] as String,
      mask: map['mask'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) =>
      Device.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Device(mac: $mac, ip: $ip, platform: $platform, system: $system, mask: $mask)';
  }

  @override
  bool operator ==(covariant Device other) {
    if (identical(this, other)) return true;

    return other.mac == mac;
  }

  @override
  int get hashCode {
    return mac.hashCode;
  }
}

int _countNonZeroBytes(Uint8List bytesArray, int start) {
  var cnt = 0;
  var i = start;
  while (bytesArray[i] != 0) {
    cnt++;
    i++;
  }
  return cnt + start;
}

Future<List<Device>> discoverDevices() async {
  // Get the interface IP address.

  final result = <Device>[];

  InternetAddress multicastAddress = InternetAddress("224.0.1.1");
  int multicastPort = 6100;
  final socket =
      await RawDatagramSocket.bind(InternetAddress.anyIPv4, multicastPort);
  socket.broadcastEnabled = true;
  print('${socket.address}:${socket.port}');
  socket.joinMulticast(multicastAddress);

  socket.send(
      [0xbb, 0x0b, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xbb, 0x0b, 0x00, 0x00],
      multicastAddress,
      multicastPort);

  print('start listen');
  final subscription = socket.listen((RawSocketEvent e) {
    Datagram? d = socket.receive();
    if (d == null) return;
    print("get data");
    int type = ByteData.view(d.data.buffer).getInt32(0, Endian.little);
    print('type: $type');

    // If the packet type is 3004, parse the packet and extract the device information.
    if (type == 3004) {
      if (d.data.buffer.lengthInBytes > 120) {
        final buffer = d.data;
        // Get the SN.
        const utf8 = Utf8Decoder();
        var start = 8;
        var end = _countNonZeroBytes(buffer, start);
        String mac = utf8.convert(buffer, 8, end).trim();

        // Get the IP address.
        start = 28;
        end = _countNonZeroBytes(buffer, start);
        String ip = utf8.convert(buffer, start, end).trim();

        start = 48;
        end = _countNonZeroBytes(buffer, start);
        // Get the mask.
        String mask = utf8.convert(buffer, start, end).trim();

        start = 84;
        end = _countNonZeroBytes(buffer, start);
        // Get the platform.
        String platform = utf8.convert(buffer, start, end).trim();

        start = 116;
        end = _countNonZeroBytes(buffer, start);
        // Get the system.
        String system = utf8.convert(buffer, start, end).trim();

        if (system != 'Depi') {
          final device = Device(
            mac: mac,
            ip: ip,
            platform: platform,
            system: system,
            mask: mask,
          );
          if (!result.contains(device)) {
            result.add(device);
          }
        }
      }
    }
  });

  await Future.delayed(const Duration(seconds: 15));
  print('cancel listen');
  subscription.cancel();
  return result;
}
