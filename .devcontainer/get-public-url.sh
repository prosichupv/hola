#!/bin/bash

# Script para obtener la URL pública del nginx en Codespace
echo "🌐 Configuración de acceso remoto a Nginx"
echo "================================="
echo ""

# Información del Codespace
CODESPACE_NAME="${CODESPACE_NAME:-unknown}"
DOMAIN="${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}"
PORT="8080"

echo "📋 Información del Codespace:"
echo "  • Nombre: $CODESPACE_NAME"
echo "  • Puerto nginx: $PORT"
echo "  • Dominio base: $DOMAIN"
echo ""

# URL pública potencial
PUBLIC_URL="https://${CODESPACE_NAME}-${PORT}.${DOMAIN}"

echo "🔗 URL pública (si el puerto está configurado como público):"
echo "  $PUBLIC_URL"
echo ""

echo "📝 Pasos para hacer el puerto público:"
echo "  1. En VS Code, ve a la pestaña 'PORTS'"
echo "  2. Busca el puerto 8080"
echo "  3. Click derecho → 'Port Visibility' → 'Public'"
echo "  4. Usa la URL que aparece arriba"
echo ""

echo "🧪 Verificar que nginx responde localmente:"
if curl -s http://localhost:8080 > /dev/null; then
    echo "  ✅ Nginx está respondiendo en localhost:8080"
else
    echo "  ❌ Nginx no responde en localhost:8080"
    echo "  💡 Ejecuta: ./.devcontainer/start-nginx.sh"
fi

echo ""
echo "🔧 Otras opciones de acceso:"
echo "  • Túnel SSH (método avanzado)"
echo "  • Port forwarding local (si tienes GitHub CLI)"
echo "  • Acceso directo desde VS Code web"