import 'dart:convert';

import 'package:weather_app/model/posts_model.dart';

PostsModel postsDetailModelFromJson(String str) =>
    PostsModel.fromJson(json.decode(str));

String postsDetailModelToJson(PostsModel data) => json.encode(data.toJson());
