import 'package:f35/features/add_pet/repository/add_pet_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPetControllerProvider = Provider((ref) =>
    AddPetController(addPetRepository: ref.read(addPetRepositoryProvider)));

class AddPetController {
  final AddPetRepository _addPetRepository;

  AddPetController({required AddPetRepository addPetRepository})
      : _addPetRepository = addPetRepository;

  void pickImagefromCamera() {
    _addPetRepository.pickImageFromCamera();
  }

  void pickImageFromGallery() {
    _addPetRepository.pickImageFromGallery();
  }

  void saveDataToFirestore(
      {required String petName,
      required String petInfo,
      required double moneyNeeded,
      required int petAge,
      required double petWeight,
      required String petGender}) {
    _addPetRepository.saveDataToFirestore(
        petName, petInfo, moneyNeeded, petAge, petWeight, petGender);
  }
}
