#!/bin/sh

echo "🔎 Variables d'environnement :"
echo "MYSQLHOST=$MYSQLHOST"
echo "MYSQLPORT=$MYSQLPORT"
echo "MYSQLUSER=$MYSQLUSER"
echo "MYSQLPASSWORD=$MYSQLPASSWORD"
echo "MYSQLDATABASE=$MYSQLDATABASE"

echo ""
echo "🔧 Génération du fichier application.yml avec envsubst..."
envsubst < /app/config/application.template.yml > /app/config/application.yml

echo ""
echo "📄 Contenu du fichier généré application.yml :"
cat /app/config/application.yml

echo ""
echo "🚀 Démarrage de l'application Spring Boot..."
exec java -jar /app/app.jar --spring.config.location=file:/app/config/application.yml
