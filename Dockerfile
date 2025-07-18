# Étape 1 : Build du projet Java avec Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ✅ Installer envsubst
RUN apt-get update && apt-get install -y gettext

# Étape 2 : Créer l'image exécutable
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/target/productmanager-be-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 2222

# Copie le template et le script
COPY config/application.template.yml /app/config/application.template.yml
COPY entrypoint.sh /entrypoint.sh

# Autoriser l'exécution du script
RUN chmod +x /entrypoint.sh

# Lancer le script au démarrage
ENTRYPOINT ["/entrypoint.sh"]

