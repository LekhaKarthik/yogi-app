import 'package:http/http.dart' as http;

Future getData(url) async {
  http.Response response = await http.get(url);
  print('*****');
  print(response.statusCode);
  return response.body;
}
