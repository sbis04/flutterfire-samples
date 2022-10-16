# Contributing to FlutterFire Samples

Welcome to the FlutterFire Samples contribution guidelines. Thank you for showing interest in contributing to this repository! 

Make sure you go through the following before starting to work on any issue or submit your first PR.

## Aim

This repo is created to contain various sample apps demonstrating the integration of **Firebase** with **Flutter**. The final goal is to create something like the [Flutter Gallery](https://github.com/flutter/gallery) app, but for Firebase. So, the final version would also have the ability to display code snippets for each of the Firebase services showcased inside the project.

> **NOTE:** For now, we are trying to get all the implementation of Firebase services in. Once it's done, work on code previews and adaptive screen sizes will be started.

## Environment Setup

To run this project locally on your system you should have the latest version of **Flutter SDK** installed on your system. If you don't have it installed and setup, follow the steps [here](https://docs.flutter.dev/get-started/install).

Follow these steps:

* **Fork** this repository.

* Then clone the repo locally using:
  
  ```bash
  https://github.com/<your-user-id>/flutterfire-samples.git
  ```

* Create a new Firebase project from the [console](https://console.firebase.google.com/).

* [Configure Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios#install-cli-tools) for each platform.

* Run the app using the command:
  
  ```bash
  cd flutterfire-samples
  flutter run
  ```

## Helping to solve issues

Go to the [**Issues**](https://github.com/sbis04/flutterfire-samples/issues) section of this project, please read carefully through the description of the issue, that you want to work on solving, to understand what solution does it need exactly.

* After you cloned the project, create a new branch with a suitable name (like `firebase-data-storage`):

    ```sh
    git checkout -b ＜new-branch-name＞
    ```

* Add/make your code changes on this branch.

* Once you have completed and tested the changes, push the branch to GitHub using:

    ```sh
    git push -u origin ＜new-branch-name＞
    ```

* Create a new pull request from GitHub. Make sure you describe your solution properly in the PR description (not doing so might result in closing of PR without any review). Mention the issue that the PR fixes, using: `Fixes #<issues-id>`.

* Wait for the PR to be reviewed by a project maintainer.
