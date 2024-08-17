import 'package:mockito/annotations.dart';
import 'package:myfirst_app/features/platform/network_info.dart';
import 'package:myfirst_app/features/product/data/data_sources/local_data_sources/local_data_sources.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';

@GenerateMocks([RemoteDataSource, LocalDataSources, NetworkInfo])
void main() {}
