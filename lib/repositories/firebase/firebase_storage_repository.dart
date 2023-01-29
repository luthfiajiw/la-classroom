import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageRepository {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) return null;

    try {
      Reference urlRef = firebaseStorage
        .child("paper_images")
        .child("${imgName.toLowerCase()}.png");

      String imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}