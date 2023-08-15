import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Device {
  String sn;
  String lanIP;
  String id;
  bool liveEnabled;
  String platform;
  String system;

  Device({
    required this.sn,
    required this.lanIP,
    required this.id,
    required this.liveEnabled,
    required this.platform,
    required this.system,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$lanIP - $sn - $platform - $system';
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
  InternetAddress multicastAddress = new InternetAddress("224.0.1.1");
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
          final Utf8Dec = const Utf8Decoder();
          var start = 8;
          var end = _countNonZeroBytes(buffer, start);
          String sn = Utf8Dec.convert(buffer, 8, end).trim();

          // Get the IP address.
          start = 28;
          end = _countNonZeroBytes(buffer, start);
          String ip = Utf8Dec.convert(buffer, start, end).trim();

          start = 48;
          end = _countNonZeroBytes(buffer, start);
          // Get the mask.
          String mask = Utf8Dec.convert(buffer, start, end).trim();

          start = 84;
          end = _countNonZeroBytes(buffer, start);
          // Get the platform.
          String platform = Utf8Dec.convert(buffer, start, end).trim();

          start = 116;
          end = _countNonZeroBytes(buffer, start);
          // Get the system.
          String system = Utf8Dec.convert(buffer, start, end).trim();

          // If the system is equal to the constant `Constants.PICKFUN_SYS_ID`, create a new `Device` object with the extracted information and add it to the `devices` list.
          if (system != 'Depi') {
            Device device = Device(
              sn: sn,
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
