@echo off
flutter pub get
flutter test
flutter test --machine --coverage > tests.output

C:\Users\flustosa\Downloads\Projetos\workspace_flutter\sonarqube-docker\sonar-scanner\bin\sonar-scanner.bat
@pause