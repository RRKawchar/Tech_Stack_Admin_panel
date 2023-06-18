
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig{

  static FirebaseOptions get platFromOptions{

    if(Platform.isIOS){
      return const FirebaseOptions(
          apiKey: '',
          appId: '',
          messagingSenderId: '963241186466',
          projectId: '',
      );
    }else{
      return const FirebaseOptions(
          apiKey: 'AIzaSyCwZwnqVI2uNZpBZX0dxXec00Cifpa_dgY',
          appId: '1:963241186466:android:d6f06ebfba8315db5533fb',
          messagingSenderId: '963241186466',
          projectId: 'location-tracking-map-83c2d',
      );
    }
  }
}