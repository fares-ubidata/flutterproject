#!/bin/bash
echo "APK_FILE=${APK_FILE}"
curl https://jsonplaceholder.typicode.com/posts
# Paramètres du référentiel Nexus
NEXUS_URL="http://127.0.0.1:8081/repository/flutter-apk/"
NEXUS_USERNAME="admin"
NEXUS_PASSWORD="123456"

# Chemin vers l'APK à déployer
APK_FILE="build/app/outputs/flutter-apk/app-release.apk"
APP_VERSION="1.0.1"

# Création de l'URL de déploiement
DEPLOY_URL="${NEXUS_URL}com/example/flutter-apk-artifact/${APP_VERSION}/flutter-apk-artifact-${APP_VERSION}.apk"

# Utilisation de curl pour le déploiement
curl -v -u "${NEXUS_USERNAME}:${NEXUS_PASSWORD}" --upload-file "${APK_FILE}" "${DEPLOY_URL}"