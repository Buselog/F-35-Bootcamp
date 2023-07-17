import 'dart:io';

import 'package:f35/features/add_pet/controller/add_pet_controller.dart';
import 'package:f35/home/screens/homepage.dart';
import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPetScreen extends ConsumerStatefulWidget {
  const AddPetScreen({super.key});

  @override
  ConsumerState<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends ConsumerState<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _explanation = '';
  double _helpNeeded = 0;
  int _age = 0;
  double _weight = 0;
  String _gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Pallete.secondaryColor,
        foregroundColor: Pallete.whiteColor,
        title: const Text(
          'Hayvan Ekle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'İsim',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen isim giriniz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Açıklama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                maxLines: 2,
                onChanged: (value) {
                  setState(() {
                    _explanation = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen kısa bir açıklama ekleyin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Gerekli yardım miktarı',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _helpNeeded = double.parse(value);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen para miktarı giriniz';
                  }
                  return null;
                },
              ),
              ////////////////////////////////////RESİM EKLEME YERİ BURAYA KODLANACAK
              const SizedBox(height: 20),
              const Row(
                children: <Widget>[
                  Text(
                    "FOTOĞRAF YÜKLE",
                    style: TextStyle(
                      color: Pallete.primaryColor,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Pallete.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
/*
              Column(
                children: [
                  /*
                  Container(
                    color: Pallete.helperColor2,
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.pets,
                      color: Pallete.primaryColor,
                    ),
                  ),*/
                  
                ],
              ),*/
              //const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Pallete.helperColor2,
                      ),
                      onPressed: () {
                        ref
                            .read(addPetControllerProvider)
                            .pickImagefromCamera();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.primaryColor),
                      label: const Text(
                        "Kamera ile ekle",
                        style: TextStyle(
                          color: Pallete.helperColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.image,
                        color: Pallete.helperColor2,
                      ),
                      onPressed: () {
                        ref
                            .read(addPetControllerProvider)
                            .pickImageFromGallery();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: Pallete.primaryColor),
                      label: const Text(
                        "Galeriden seç",
                        style: TextStyle(
                          color: Pallete.helperColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Fotoğrafı kaldır",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///////////////////////////////////////////////////////////////////////
              const SizedBox(height: 20),
              const Row(
                children: <Widget>[
                  Text(
                    "TEMEL BİLGİLER",
                    style: TextStyle(
                      color: Pallete.secondaryColor,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Pallete.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Yaş',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _age = int.parse(value);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen yaş giriniz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Kilo',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _weight = double.parse(value);
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen kilo giriniz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cinsiyet',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen cinsiyet giriniz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.pets,
                  color: Pallete.primaryColor,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(addPetControllerProvider).saveDataToFirestore(
                        petName: _name,
                        petInfo: _explanation,
                        moneyNeeded: _helpNeeded,
                        petAge: _age,
                        petWeight: _weight,
                        petGender: _gender);
                    print('Name: $_name');
                    print('Explanation: $_explanation');
                    print('Age: $_age');
                    print('Weight: $_weight');
                    print('Gender: $_gender');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Pallete.helperColor2,
                  foregroundColor: Pallete.whiteColor,
                  minimumSize: const Size.fromHeight(45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                label: const Text(
                  'EKLE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Pallete.primaryColor,
                    fontSize: 17,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
