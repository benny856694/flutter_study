import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Device {
  String mac;
  String lanIP;
  String id;
  bool liveEnabled;
  String platform;
  String system;

  Device({
    required this.mac,
    required this.lanIP,
    required this.id,
    required this.liveEnabled,
    required this.platform,
    required this.system,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$lanIP - $mac - $platform - $system';
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

void main() async {
  // Get the interface IP address.
  InternetAddress multicastAddress = InternetAddress("224.0.1.1");
  int multicastPort = 6100;
  RawDatagramSocket.bind("192.168.0.251", multicastPort)
      .then((RawDatagramSocket socket) {
    print('Datagram socket ready to receive');
    print('${socket.address.address}:${socket.port}');

    socket.joinMulticast(multicastAddress);
    print('Multicast group joined');

    socket.send([
      0xbb,
      0x0b,
      0x00,
      0x00,
      0x04,
      0x00,
      0x00,
      0x00,
      0xbb,
      0x0b,
      0x00,
      0x00
    ], multicastAddress, multicastPort);

    final start = DateTime.now();
    socket.listen((RawSocketEvent e) {
      Datagram? d = socket.receive();
      final now = DateTime.now();
      if (now.difference(start) >= const Duration(seconds: 5)) return;
      if (d == null) return;

      int type = ByteData.view(d.data.buffer).getInt32(0, Endian.little);

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

          // If the system is equal to the constant `Constants.PICKFUN_SYS_ID`, create a new `Device` object with the extracted information and add it to the `devices` list.
          if (system != 'Depi') {
            Device device = Device(
              mac: mac,
              lanIP: ip,
              id: "0",
              liveEnabled: true,
              platform: platform,
              system: system,
            );
            print(device.toString());
          }
        }
      }
    });
  });
}
