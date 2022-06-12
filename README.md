# FlutterFire Samples

This repo is created to contain various sample apps demonstrating the integration of **Firebase** with **Flutter**. The final goal is to create something like the [Flutter Gallery](https://github.com/flutter/gallery) app, but for Firebase.

> **NOTE:** This entire repo uses the latest **Flutter 3.0 stable** release, with **null safety** enabled, for creating the sample apps.

If you like the content of this repository, please don't forget to :star: this.

> :construction: . :red_circle: . The `master` branch is currently **WIP** for adding all types of Firebase samples in this repo. If you want to try out any sample checkout the following branches:

Currently the repo contains:

* [Firebase Authentication (email & password)](https://github.com/sbis04/flutterfire-samples/tree/email-password)
* [Firebase Authentication (using Google Sign-In)](https://github.com/sbis04/flutterfire-samples/tree/google-sign-in)
* [Cloud Firestore database (CRUD operations)](https://github.com/sbis04/flutterfire-samples/tree/crud-firestore)

## Contents

The aim of this repo is to include examples for:

- [ ] **Authentication**
  - [x] Email & password registration & login
  - [x] Login using various providers (Google, GitHub, Apple, etc.)*
  - [ ] Phone OTP verification


- [ ] **Database**
  - [x] CRUD operations on Firebase Cloud Firestore
  - [ ] Storing & retrieving images/videos/files to/fro Cloud Storage
  - [ ] Using Realtime Database

- [ ] **Backend Actions**
  - [ ] Cloud Functions
  - [ ] User Presence tracking
  - [ ] Push notifications using Firebase Cloud Messaging (FCM)

- [ ] **Machine Learning**
  - [ ] Test recognition
  - [ ] Face detection
  - [ ] Image recognition (more might be added here)

- [ ] **Other utilities**
  - [ ] Analytics/Crashlytics
  - [ ] Remote config
  - [ ] A/B testing
  - [ ] In-app messaging
  - [ ] Dynamic Linking
  - [ ] Firebase extensions (BETA)

> *Only Google Sign-In implemented currently.

---

## Current `master` branch description

This is a sample app demonstrating **Firebase Authentication** in Flutter using email & password. Also shows how to send *email verification* and set up *auto login*.

> **NOTE:** This sample app uses the latest **Flutter 2.0 stable release**, with *null safety* enabled. Make sure you are using Flutter 2 in order to prevent any build errors. Tested on Android, iOS & Web.

![](https://github.com/sbis04/flutterfire-samples/raw/master/screenshots/flutterfire_authentication_cover.png)

App in action :rocket: :

![](https://github.com/sbis04/flutterfire-samples/raw/master/screenshots/flutterfire_auth.gif)

## Plugins

For this project you have to add two plugins:

- [firebase_core](https://pub.dev/packages/firebase_core): Required for initializing Firebase and using any other Firebase plugins.
- [firebase_auth](https://pub.dev/packages/firebase_auth): For using Firebase Authentication service in Flutter.

The latest version of both these plugins support *null safety*.

## Usage

If you want to try out the this sample app, first you have to create and configure a Firebase project:

* Clone the project:
  
  ```bash
  https://github.com/sbis04/flutterfire-samples.git
  ```

* Create a new Firebase project from the [console](https://console.firebase.google.com/).

* Configure the Firebase for each platform.

* Run the app using the command:
  
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
