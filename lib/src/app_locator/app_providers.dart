import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:snap_grid/src/core/network/network.dart';
import 'package:snap_grid/src/features/home/provider/home_provider.dart';

//a  one time instantiation of the app network service
//which would passed to all providers needing this service

AppNetwork appNetwork = AppNetwork();

//a declaration of all the providers needed in the app which would be placed ontop of the app widget tree
//an app state provider
List<SingleChildWidget> get appProvider {
  return [
    ChangeNotifierProvider(create: (context) => PhotoProvider(appNetwork)),
  ];
}
