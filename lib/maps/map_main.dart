import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MapMain extends StatefulWidget {
  const MapMain({Key? key}) : super(key: key);

  @override
  _MapMainState createState() => _MapMainState();
}

class _MapMainState extends State<MapMain> {
  // Open Street Map, Map controler
  final MapController _mapController = MapController();

  // Poins of the map, corner bottom right, corner top left, center
  var points = [
    LatLng(21.426097691337695, -104.80357503688333),
    LatLng(21.549728701692842, -104.94124745677013),
    LatLng(21.511917919670996, -104.89163398205262),
  ];

  //Variables
  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          // Close Dial
          isDialOpen.value = false;
          return false;
        }else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.lightBlue,
          overlayColor: Colors.white,
          overlayOpacity: 0.0,
          spaceBetweenChildren: 12,
          spacing: 12,
          closeManually: true,
          children: [
            SpeedDialChild(
                // Icon ZOOM OUT
                child: const Icon(Icons.zoom_out),
                backgroundColor: Colors.red,
                label: 'Zoom out',
                foregroundColor: Colors.white,
                onTap: () {
                  //Function to zoom out
                  var newZoom = _mapController.zoom - 0.5;
                  _mapController.move(_mapController.center, newZoom);
                }
            ),
            SpeedDialChild(
                // Icon ZOOM IN
                child: const Icon(Icons.zoom_in),
                backgroundColor: Colors.green,
                label: 'Zoom in',
                foregroundColor: Colors.white,
                onTap: () {
                  //Function to zoom out
                  var newZoom = _mapController.zoom + 0.5;
                  _mapController.move(_mapController.center, newZoom);
                }
            ),
            SpeedDialChild(
                // Icon CENTER
                child: const Icon(Icons.api),
                backgroundColor: Colors.blue,
                label: 'Center',
                foregroundColor: Colors.white,
                onTap: () {
                  //Function to center
                  _mapController.move(points[2], 13);
                }
            ),
          ],
        ),
        body: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: points[2],
            //bounds: LatLngBounds(points[1], points[0]),
            zoom: 13,
          ),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: null,
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
      ),
    );
  }
}
