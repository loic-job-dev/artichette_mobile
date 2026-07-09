# Procédure de déploiement

## Prérequis
Installer Flutter SDK, Android Studio, Xcode et Git, puis vérifier avec :
```bash
flutter doctor
flutter --version
```

## Récupération et configuration du projet
```bash
git clone <URL_DU_DEPOT>
git checkout main
flutter pub get
```

L'app utilise une variable `API_URL` pour définir le backend :
- **Dev local** : `flutter run --dart-define=API_URL=http://192.000.0.00:8080`
- **Prod** : `flutter build apk --release --dart-define=API_URL=https://api.maprod.com`

## Vérifications avant publication
```bash
flutter analyze
flutter test
flutter build apk --release      # Android
flutter build ios --release      # iOS
```

## Publication Android (Google Play)
1. Générer le bundle : `flutter build appbundle --release --dart-define=API_URL=https://api.monprod.com` → produit `build/app/outputs/bundle/release/app-release.aab`
2. Signer l'app via `android/key.properties` (storePassword, keyPassword, keyAlias, storeFile) — **ce fichier keystore ne doit jamais être commité sur Git**.
3. Sur Google Play Console : sélectionner l'app → créer une version → importer le `.aab` → renseigner version, notes, captures, description, classification → envoyer pour validation.

## Publication iOS (App Store)
1. `cd ios && pod install && cd ..`
2. Générer l'archive : `flutter build ipa --release --dart-define=API_URL=https://api.monprod.com` → produit `build/ios/ipa/*.ipa`
3. Dans Xcode : vérifier Bundle ID, version, build number, certificats → envoyer via Xcode/Transporter.
4. Sur App Store Connect : compléter description, captures, confidentialité, catégorie → soumettre pour validation.

## Versionnement
Dans `pubspec.yaml`, format `version_utilisateur+numéro_build`, ex : `1.2.0+15`.

## CI/CD
Un pipeline GitHub Actions (`.github/workflows/flutter.yml`) installe Flutter, les dépendances, exécute analyse + tests et génère automatiquement une APK disponible dans les artefacts du workflow.

## Contrôles post-publication
Installer depuis le store, vérifier démarrage, authentification, appels API et logs d'erreur.

## Mise à jour d'une version
Modifier le code → incrémenter la version → tester → générer le package → publier → vérifier la disponibilité après validation.