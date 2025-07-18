#!/bin/sh

echo "➡️ Remplacement des variables d'environnement dans application.yml..."
envsubst < /app/config/application.template.yml > /app/config/application.yml

echo "✅ Configuration générée. Lancement de l'application..."
exec java -jar /app/app.jar
