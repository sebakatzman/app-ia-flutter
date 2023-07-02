import 'package:app_demo/data/ia_response.dart';
import 'package:http/http.dart' as http;

Future<IaResponse> sendQuestionToChatbot(String question) async {
  Uri url =
      Uri.http('10.7.70.190:8080', 'response.json', {'question': question});
  http.Response response = await http.get(url);

  return iaResponseFromJson(response.body);
}
