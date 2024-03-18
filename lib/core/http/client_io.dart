import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';


Client createClient() => IOClient(
  HttpClient()
    ..userAgent = 'moe.null.meme_client/0.0.1'
    ..idleTimeout = const Duration(seconds: 5),
);
