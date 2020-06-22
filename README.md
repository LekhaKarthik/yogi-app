# yogi

Your Personal AI Yoga Trainer.

Get your yoga posture to a perfect one without a trainer besides you.

## Steps to download and run frontend

1. Git clone this repository using the below command:
```
git clone https://github.com/LekhaKarthik/yogi-app.git
```

2. Open the cloned folder and run the following command to install the necessary packages and dependencies:
```
flutter pub get
```
Or if you are using Android Studio just click "Pub get" button which comes when you open pubspec.yaml file in the main directory.

3. The next step is to run the "main.dart" which is located in the main directory.

## Steps to download and run backend

1. Git clone the [backend repository](https://github.com/ssrtshah/Yoga-Posture.git) using this below command:
```
git clone https://github.com/ssrtshah/Yoga-Posture.git
```

2. Follow the steps given in the README.md file in that repository to install necessary packages.

3. Install ADB using the instructions given in this [link](https://www.xda-developers.com/install-adb-windows-macos-linux/)

4. Connect your mobile device to laptop and enable debug mode on your phone.

5. Run the following command in terminal after plugging in your phone:
```
adb reverse tcp:5000 tcp:5000
```

6. Navigate to the following directory in the backend cloned repository.
```
cd Yoga-Posture/OpenPose
```

7. Run the api.py file.
```
python3 api.py
```

Now the frontend and backend can be tested or worked upon!!
