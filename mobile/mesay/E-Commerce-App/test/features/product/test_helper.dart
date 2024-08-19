import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:myfirst_app/features/network/network_info.dart';
import 'package:myfirst_app/features/product/data/data_sources/local_data_sources/local_data_sources.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';
import 'package:myfirst_app/features/product/domain/repository/product_repository.dart';

@GenerateMocks([
  RemoteDataSource,
  LocalDataSources,
  NetworkInfo,
  InternetConnectionChecker,
  ProductRepository
])
void main() {}
