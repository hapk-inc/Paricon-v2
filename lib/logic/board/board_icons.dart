import 'package:flutter/material.dart';

const List<IconData> _boardIcons = [
  // Icons.filter_alt,
  //Travel 10
  Icons.fitness_center, Icons.lunch_dining, Icons.spa,
  Icons.family_restroom, Icons.airplane_ticket, Icons.icecream,
  Icons.golf_course, Icons.smoking_rooms, Icons.flight,

  //Transportation 2
  Icons.train, Icons.directions_boat,

  //Text 3
  Icons.text_fields, Icons.cut,
  //Icons.abc,

  // 1
  Icons.security,

  //Device 10
  Icons.light_mode, Icons.dark_mode, Icons.password, Icons.gps_fixed,
  Icons.flag, Icons.bluetooth, Icons.cable,
  Icons.access_alarm, Icons.one_x_mobiledata,
  // Icons.lte_mobiledata,

  //search 10
  Icons.chair, Icons.podcasts, Icons.coffee, Icons.shower,
  //Icons.yard,
  Icons.light, Icons.flatware, Icons.coffee_maker, Icons.blender,
  //Icons.bedroom_baby,

  //Places 18
  Icons.storefront, Icons.house, Icons.ac_unit, Icons.checkroom,
  Icons.grass, Icons.all_inclusive, Icons.airport_shuttle,
  Icons.beach_access, Icons.pool, Icons.roofing,
  Icons.sports_bar, Icons.bathtub, Icons.child_friendly,

  //Icons.elevator,
  Icons.wash, Icons.fire_extinguisher, Icons.iron,
  //Icons.escalator,

  //Notification
  Icons.sync,
  Icons.vpn_lock,
  Icons.vpn_key,

  //Maps
  Icons.place, Icons.category, Icons.near_me,
  Icons.handyman, Icons.directions_run, Icons.celebration,
  Icons.delivery_dining, Icons.fastfood, Icons.zoom_out_map,
  Icons.local_gas_station, Icons.local_parking,
  Icons.diamond, Icons.traffic, Icons.two_wheeler, Icons.sailing,
  Icons.electrical_services, Icons.connecting_airports, Icons.sos,

  //social
  Icons.pets, Icons.elderly_woman,

  //Text Formatting
  Icons.format_bold, Icons.format_underline,

  //Audio & Video
  Icons.music_note, Icons.thirty_fps,

  //Activities
  Icons.architecture, Icons.self_improvement, Icons.piano, Icons.sports,

  //Hardware
  Icons.laptop_mac, Icons.android,
];

Map<int, IconData> get boardIcon => _boardIcons.asMap();
