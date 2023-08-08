#!/bin/bash

FLUTTER_APP_NAME=$(grep "name:" pubspec.yaml | awk -F ": " '{ print $2 }')

# Paramètres de l'application
APP_NAME="${FLUTTER_APP_NAME}"

# Paramètres du référentiel Nexus
NEXUS_URL="https://fcfa-62-72-97-221.ngrok-free.app/repository/flutter-apk/"
NEXUS_USERNAME="admin"
NEXUS_PASSWORD="123456"

# Chemin vers l'APK à déployer
APK_FILE="build/app/outputs/flutter-apk/app-release.apk"
APP_VERSION="1.0.2"

# Création de l'URL de déploiement
DEPLOY_URL="${NEXUS_URL}/${APP_NAME}/${APP_VERSION}/flutter-apk-${APP_VERSION}.apk"

# Utilisation de curl pour le déploiement
curl -v -u "${NEXUS_USERNAME}:${NEXUS_PASSWORD}" --upload-file "${APK_FILE}" "${DEPLOY_URL}"