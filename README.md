# FlutterFire Samples

This is a sample app demonstrating how to perform CRUD operations on **Firebase Cloud Firestore** using Flutter. We have build a simple note management app for the demonstration.

> **NOTE:** This sample app uses the latest **Flutter 2.0 stable release**, with *null safety* enabled. Make sure you are using Flutter 2 in order to prevent any build errors. Tested on Android, iOS & Web.

![](https://github.com/sbis04/flutterfire-samples/raw/crud-firestore/screenshots/flutter_fire_crud.png)

App in action :rocket: :

![](https://github.com/sbis04/flutterfire-samples/raw/crud-firestore/screenshots/firebase_crud_demo.gif)

## Firestore structure

The Cloud Firestore database structure used in the sample app is as follows:

![database_1](https://github.com/sbis04/flutterfire-samples/raw/crud-firestore/screenshots/database_1.png)

![database_2](https://github.com/sbis04/flutterfire-samples/raw/crud-firestore/screenshots/database_2.png)

## Plugins

For this project you have to add two plugins:

- [firebase_core](https://pub.dev/packages/firebase_core): Required for initializing Firebase and using any other Firebase plugins.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore): Required for interacting with the Firestore database.

The latest version of both these plugins support *null safety*.

## Usage

If you want to try out the this sample app, first you have to create and configure a Firebase project:

* Clone the project:
  
  ```bash
  https://github.com/sbis04/flutterfire-samples.git
  ```

* Create a new **Firebase project** from the [console](https://console.firebase.google.com/).

* Configure the Firebase for each platform.

* Enable **Firestore** from the Firebase dashboard.

* Run the app using command (make sure you are on the correct channel):
  
  ```bash
  cd flutterfire-samples
  flutter run
  ```

## License

Copyright (c) 2021 Souvik Biswas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
