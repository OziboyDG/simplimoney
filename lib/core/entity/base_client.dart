// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class BaseClient {


  static var client = http.Client();

  static Future<String> getUUID() async{
    var url = Uri.parse("https://www.uuidgenerator.net/api/version4");
    var response = await client.get(url);
    print("uuid: ${response.body}");
    return response.body;
  }

  static Future<bool> transfer(String n, String a) async{
    String body = '''{\r\n    "amount": $a,\r\n    "currency": "EUR",\r\n    "externalId": "0001",\r\n    "payee": {\r\n        "partyIdType": "MSISDN",\r\n        "partyId": $n\r\n    },\r\n    "payerMessage": "enjoy",\r\n    "payeeNote": "enjoy"\r\n}''';
    String xRef = await getUUID();
    var headers = {
  'X-Reference-Id': xRef,
  'X-Target-Environment': 'sandbox',
  'Ocp-Apim-Subscription-Key': 'ddbe97f7b2fd4625b18d0a6c54f2fa10',
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSMjU2In0.eyJjbGllbnRJZCI6ImMzOWFhZGZhLTY2ZTYtNDE4OC1iN2Y2LTNhNzNjOTBjOTFiMyIsImV4cGlyZXMiOiIyMDIzLTExLTIzVDEwOjI5OjU4LjA4MCIsInNlc3Npb25JZCI6Ijc4NmI5ZGRmLTQ1YWQtNGYxMC1iMzY0LWI3Y2U1NjI2MDEzYyJ9.F9ZWeKzddLN_imRYYVbGrWzS3Ao3y5TA21fpmkAIRtk93yIWlspCxvDDmkhf5PDdGxZfKiNSa4mX9nAqoli3V3_5pSFguMIj0Ds2CpFq9kfnbOLgBRr9iAEwStyU5rWiHNGmN5vYjyN19r5NLbfFzsoPoYcTaNNQ0R7TAsG_PKB6qpPDQV1IjCOJnkDhit6nTCS0FTKJ8HeDJhixah4MtCSY5EBOKQrpKnou1IpvmJVkB3oXjL6ZoQXLm1A_nM6fWk-RofTErQMkhw5XoBQTB9ZNWJLreibuVxu6UWxFceU8grsrvXtbusslAefv6ENBEsrSSSLppsolPWR5k-HeWQ'
};
  var response =  await client.post(Uri.parse('https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer'),headers: headers, body: body);

  if (response.statusCode == 200) {
  print(response.body);
  return true;
}
else {
  print(response.reasonPhrase);
  return false;
}
  }

}





