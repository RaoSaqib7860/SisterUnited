import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';

makePhoneCall({String number}) async {
  await launch("tel://$number");
}

void sendSMStoHelpLine(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

redirectToPage({String number}) async {
  await launch("$number");
}
sendMail({String number}) async {
  await launch('$number');
}
