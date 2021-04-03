import 'package:url_launcher/url_launcher.dart';

class WhatsAppAPIService {
  sendMessage(int codigoPais, int numero, String mensagem) async {
    String url =
        'https://api.whatsapp.com/send?phone=+$codigoPais$numero&text=$mensagem';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch URL';
    }
  }
}
