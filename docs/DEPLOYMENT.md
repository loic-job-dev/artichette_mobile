# Procédure de déploiement de l'application Flutter

## 1. Présentation

Cette documentation décrit la procédure permettant de générer et publier une nouvelle version de l'application mobile Flutter sur les stores.

Elle couvre :

* la préparation du projet ;
* la configuration des environnements ;
* la génération des fichiers Android et iOS ;
* la publication sur le Google Play Store et l'Apple App Store.

---

# 2. Prérequis

## Environnement de développement

Installer :

* Flutter SDK
* Android Studio
* Xcode (pour iOS)
* Git

Vérifier l'installation :

```bash
flutter doctor
```

La version Flutter utilisée par le projet doit être vérifiée :

```bash
flutter --version
```

---

# 3. Récupération du projet

Cloner le dépôt :

```bash
git clone <URL_DU_DEPOT>
```

Se positionner sur la branche de déploiement :

```bash
git checkout main
```

ou sur la branche correspondant à l'environnement souhaité.

Installer les dépendances :

```bash
flutter pub get
```

---

# 4. Configuration de l'environnement

L'application utilise une variable `API_URL` permettant de définir l'adresse du serveur backend.

## Environnement de développement

Lancement local :

```bash
flutter run \
--dart-define=API_URL=http://192.168.2.34:8080
```

## Environnement de production

Pour une publication sur store :

```bash
flutter build apk \
--release \
--dart-define=API_URL=https://api.monprod.com
```

La valeur de l'API doit correspondre au serveur de production disponible.

---

# 5. Vérifications avant publication

Avant de générer une version distribuable :

## Analyse du code

```bash
flutter analyze
```

## Exécution des tests

```bash
flutter test
```

## Vérification de la compilation

Android :

```bash
flutter build apk --release
```

iOS :

```bash
flutter build ios --release
```

---

# 6. Publication Android (Google Play Store)

## 6.1 Génération du fichier de publication

Pour le Google Play Store, utiliser un Android App Bundle :

```bash
flutter build appbundle \
--release \
--dart-define=API_URL=https://api.monprod.com
```

Le fichier généré est :

```
build/app/outputs/bundle/release/app-release.aab
```

---

## 6.2 Signature Android

L'application doit être signée avec une clé privée.

Le fichier de configuration est :

```
android/key.properties
```

Exemple :

```properties
storePassword=<mot_de_passe>
keyPassword=<mot_de_passe>
keyAlias=<alias>
storeFile=<chemin_du_keystore>
```

Le fichier keystore ne doit jamais être ajouté au dépôt Git.

---

## 6.3 Publication Google Play Console

Étapes :

1. Se connecter à Google Play Console.
2. Sélectionner l'application.
3. Créer une nouvelle version.
4. Importer le fichier :

```
app-release.aab
```

5. Compléter :

    * numéro de version ;
    * notes de version ;
    * captures d'écran ;
    * description ;
    * classification du contenu.

6. Envoyer la version pour validation.

Après validation par Google, l'application devient disponible sur le Play Store.

---

# 7. Publication iOS (Apple App Store)

## 7.1 Préparation

Installer les dépendances iOS :

```bash
cd ios
pod install
```

Puis revenir à la racine :

```bash
cd ..
```

---

## 7.2 Génération de la version iOS

Créer une archive :

```bash
flutter build ipa \
--release \
--dart-define=API_URL=https://api.monprod.com
```

Le fichier généré est :

```
build/ios/ipa/*.ipa
```

---

## 7.3 Publication App Store Connect

Étapes :

1. Ouvrir le projet iOS dans Xcode.

2. Vérifier :

    * Bundle Identifier ;
    * version ;
    * numéro de build ;
    * certificats Apple.

3. Envoyer l'application via Xcode ou Transporter.

4. Se connecter à App Store Connect.

5. Compléter les informations :

    * description ;
    * captures d'écran ;
    * confidentialité ;
    * catégorie.

6. Soumettre l'application pour validation Apple.

---

# 8. Versionnement

Avant chaque publication, modifier :

Dans `pubspec.yaml` :

```yaml
version: 1.0.0+1
```

Format :

```
version_utilisateur+numéro_build
```

Exemple :

```
1.2.0+15
```

---

# 9. Déploiement automatisé

Le projet contient un pipeline CI GitHub Actions permettant :

* l'installation de Flutter ;
* l'installation des dépendances ;
* l'analyse du code ;
* l'exécution des tests ;
* la génération automatique d'une APK.

Le fichier du pipeline est :

```
.github/workflows/flutter.yml
```

L'APK générée est disponible dans les artefacts du workflow.

---

# 10. Contrôles après publication

Après mise en ligne :

* installer l'application depuis le store ;
* vérifier le démarrage ;
* tester l'authentification ;
* vérifier les appels API ;
* contrôler les logs d'erreur.

---

# 11. Gestion d'une nouvelle version

Pour publier une mise à jour :

1. Modifier le code.
2. Mettre à jour le numéro de version.
3. Lancer les tests.
4. Générer un nouveau package.
5. Publier une nouvelle version sur les stores.
6. Vérifier la disponibilité après validation.
