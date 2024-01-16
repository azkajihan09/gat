import 'bloc/atm_location_bloc.dart';
import 'dart:async';
import 'models/atm_location_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:windy_sabtami_s_application1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AtmLocationScreen extends StatelessWidget {
  AtmLocationScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<AtmLocationBloc>(
        create: (context) => AtmLocationBloc(
            AtmLocationState(atmLocationModelObj: AtmLocationModel()))
          ..add(AtmLocationInitialEvent()),
        child: AtmLocationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AtmLocationBloc, AtmLocationState>(
        builder: (context, state) {
      return SafeArea(child: Scaffold(body: _buildAtmLocation(context)));
    });
  }

  /// Section Widget
  Widget _buildAtmLocation(BuildContext context) {
    return SizedBox(
        height: 768.v,
        width: double.maxFinite,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }
}
