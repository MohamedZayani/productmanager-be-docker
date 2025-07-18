#!/bin/sh

echo "➡️ Remplacement des variables d'environnement dans application.yml..."
envsubst < /app/config/application.template.yml > /app/config/application.yml

echo "✅ Configuration générée dans /app/config/application.yml"
cat /app/config/application.yml

echo "🚀 Lancement de l'application Spring Boot..."
exec java -jar app.jar --spring.config.location=file:/app/config/application.yml