import java.net.URLDecoder

// Membaca dart-defines dengan format Kotlin DSL
val dartEnvironmentVariables = project.providers.gradleProperty("dart-defines")
    .orNull
    ?.split(",")
    ?.map { URLDecoder.decode(it, "UTF-8") }
    ?: emptyList()

var appNameDef = "DEV - Amanda"
dartEnvironmentVariables.forEach { defKeyValue ->
    val pair = defKeyValue.split("=")
    if (pair.size == 2 && pair[0] == "APP_NAME") {
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

        // Memasukkan nama aplikasi dinamis di format Kotlin DSL
        resValue("string", "app_name", appNameDef)
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