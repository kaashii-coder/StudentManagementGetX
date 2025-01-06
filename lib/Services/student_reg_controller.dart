
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StudentRegisterController extends GetxController {
 

  final picker = ImagePicker();
  var imagePath = ''.obs; // Observable variable to track image path

  // Function to pick an image
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }
  
  

}
