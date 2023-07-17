import 'dart:ui';

import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailAppBar extends StatelessWidget {
  final String _animal;

  DetailAppBar({required String animal}) : _animal = animal;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      expandedHeight: 275.0,
      backgroundColor: Pallete.primaryColor,
      elevation: 0.0,
      pinned: false,
      snap: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Ink.image(
          image: AssetImage(_animal == 'Kedi'
              ? 'assets/images/tekirkedi.jpeg'
              : _animal == 'Köpek'
                  ? 'assets/images/sokak_kopegi.jpeg'
                  : 'assets/images/karga.jpeg'),
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 22.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
        ),
      ),
      leadingWidth: 60.0,
      leading: Container(
        margin: const EdgeInsets.only(left: 24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
                height: 15.0,
                width: 15.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.20),
                ),
                child: InkWell(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )),
          ),
        ),
      ),
    );
  }
}
