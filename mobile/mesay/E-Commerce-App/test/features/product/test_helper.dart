import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:myfirst_app/features/network/network_info.dart';
import 'package:myfirst_app/features/product/data/data_sources/local_data_sources/local_data_sources.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';
import 'package:myfirst_app/features/product/domain/repository/product_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  RemoteDataSource,
  LocalDataSources,
  NetworkInfo,
  InternetConnectionChecker,
  ProductRepository,
  SharedPreferences,
  http.Client,
])
void main() {}
