import java.net.URLDecoder

// Kode untuk membaca variabel --dart-define dari Flutter
def dartEnvironmentVariables = []
if (project.hasProperty('dart-defines')) {
    dartEnvironmentVariables = project.property('dart-defines').split(',').collect {
        URLDecoder.decode(it, "UTF-8")
    }
}

def appNameDef = "DEV - Amanda"
dartEnvironmentVariables.each { defKeyValue ->
    def pair = defKeyValue.split('=')
    if (pair.length == 2 && pair[0] == 'APP_NAME') {
        appNameDef = pair[1]
    }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.uas_mobile_lanjut"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.uas_mobile_lanjut"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // TAMBAHKAN BARIS INI: Meneruskan nama aplikasi ke Manifest Android
        resValue "string", "app_name", appNameDef
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}