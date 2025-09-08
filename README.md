# pokedex_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Requirement
- Android Studio / VS Code
- flutter sdk use `v.3.27.1`
- Java version OpenJDK `v.17.0.12`

clone this project into your lokal computer
```bash
git clone https://github.com/ridwanlte/pokedex_app.git
```

change to directory
```bash
cd pokedex_app
```

## installation & Running
install `flutter` package
```bash
flutter pub get
```
Running to debug

## Build Android

create keystore
```bash
keytool -genkey -v -keystore android/app/pokedex.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias pokedex
```
then fill in the same form as below
```bash
What is your first and last name?
  [Unknown]:  Pokedex
What is the name of your organizational unit?
  [Unknown]:  Pokedex
What is the name of your organization?
  [Unknown]:  Pokedex
What is the name of your City or Locality?
  [Unknown]:  Yogyakarta
What is the name of your State or Province?
  [Unknown]:  Indoonesia
What is the two-letter country code for this unit?
  [Unknown]:  62
Is CN=Pokedex, OU=Pokedex, O=Pokedex, L=Yogyakarta, ST=Indonesia, C=62 correct?
  [no]:  y
```

Then create a file named [project]/android/key.properties that contains a reference to your keystore.
```bash
storePassword=2wsx1qaz
keyPassword=2wsx1qaz
keyAlias=pokedex_app
storeFile=pokedex_app.jks
```
More Information, (https://docs.flutter.dev/deployment/android)

Next, clean flutter dan get dependency
```bash
flutter clean && flutter pub get
```

For Build APK
```bash
flutter build apk --release -build-name=${detail_version} --build-number=${code_version} // build apk
```
For Build APPBUNDLE
```bash
flutter build appbundle -build-name=${detail_version} --build-number=${code_version} // build appbundle
```

## Build IOS
```bash
flutter build ipa
```

## Setup CI/CD Github
create folder workflows in .github and create file main.yaml this source for setup
```bash
name: "Build & Release"
on:
  pull_request:
    branches:
      - master
  push:
    branches:
      - master
jobs:
  build:
    name: Build & Release
    runs-on: macos-latest
    
    steps:
      #1 Checkout Repository
      - name: Checkout Repository
        uses: actions/checkout@v4

      #2 Setup Java
      - name: Set Up Java
        uses: actions/setup-java@v3.12.0
        with:
          distribution: 'oracle'
          java-version: '21'

      #3 Setup Flutter
      - name: Set Up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.27.1'
          channel: 'stable'

      #4 Install Dependencies
      - name: Install Dependencies
        run: flutter pub get

      #5 Setup Keystore
      - name: Decode Keystore
        run: |
          echo "${{ secrets.KEYSTORE_BASE64 }}" | base64 --decode > android/app/news_app.jks   
      - name: Create key.properties
        run: |
          echo "storePassword=2wsx1qaz" > android/key.properties
          echo "keyPassword=2wsx1qaz" >> android/key.properties
          echo "keyAlias=news_app" >> android/key.properties
          echo "storeFile=news_app.jks" >> android/key.properties
        
      #6 Building APK
      - name: Build APK
        env:
          KEY_PASSWORD: 2wsx1qaz
        run: flutter build apk --release

      #7 Building App Bundle (aab)
      - name: Build appBundle
        run: flutter build appbundle

      #8 Build IPA ( IOS Build )
      - name: Build IPA
        run: flutter build ipa --no-codesign
        # run: flutter build ios --release
      - name: Compress Archives and IPAs
        run: |
          cd build
          tar -czf ios_build.tar.gz ios

      #9 Upload Artifacts
      - name: Upload Artifacts
        uses: actions/upload-artifact@v3
        with:
          name: Releases
          path: |
            build/app/outputs/flutter-apk/app-release.apk
            build/app/outputs/bundle/release/app-release.aab
            build/ios_build.tar.gz

      #10 Extract Version
      - name: Extract version from pubspec.yaml
        id: extract_version
        run: |
          version=$(grep '^version: ' pubspec.yaml | cut -d ' ' -f 2 | tr -d '\r')
          echo "VERSION=$version" >> $GITHUB_ENV

      #11 Check if Tag Exists
      - name: Check if Tag Exists
        id: check_tag
        run: |
          if git rev-parse "v${{ env.VERSION }}" >/dev/null 2>&1; then
            echo "TAG_EXISTS=true" >> $GITHUB_ENV
          else
            echo "TAG_EXISTS=false" >> $GITHUB_ENV
          fi

      #12 Modify Tag if it Exists
      - name: Modify Tag
        if: env.TAG_EXISTS == 'true'
        id: modify_tag
        run: |
          new_version="${{ env.VERSION }}-build-${{ github.run_number }}"
          echo "VERSION=$new_version" >> $GITHUB_ENV
        
      #13 Create Release
      - name: Create Release
        uses: ncipollo/release-action@v1
        with:
          artifacts: "build/app/outputs/flutter-apk/app-release.apk,build/app/outputs/bundle/release/app-release.aab,build/ios_build.tar.gz"
          tag: v${{ env.VERSION }}
          token: ${{ secrets.TOKEN }}

      # Optional
      # - name: Push to Releases
      #   uses: ncipollo/release-action@v1
      #   with: 
      #     artifacts: "build/app/outputs/flutter-apk/*.apk"
      #     tag: v1.0.${{ github.run_number }}
      #     token: ${{secrets.TOKEN}} 
```

## Powered By

[RIDWAN RAMADHAN](https://ridwanportofolio.netlify.app/)
