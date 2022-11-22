import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/navbarItem/navbar_item.dart';
import '../theme_dark_light/change_theme.dart';
import '../theme_dark_light/themes.dart';


class NavigationState extends Equatable
{
 final NavbarItem navbarItem;
 final int index;


  const NavigationState(this.navbarItem,this.index,  );

  @override
  // TODO: implement props
  List<Object?> get props => [navbarItem,index, ];
}