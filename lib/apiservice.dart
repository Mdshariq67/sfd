import 'dart:convert';

import 'package:http/http.dart' as http;

var link = "https://tossas.in/youngman/software/api/course-details/1";

getQuiz() async {
  var url;
  url = await http.get(Uri.parse("https://tossas.in/youngman/software/api/course-details/2"));
  // .get(Uri.parse("https://vrt.vahanacloud.com/router/engine/v1/"));
  return json.decode(url.body)["data"];
  }
