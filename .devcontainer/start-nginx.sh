#!/bin/bash

# Script para iniciar nginx automáticamente
echo "🚀 Iniciando nginx..."

# Verificar si nginx está corriendo
if pgrep nginx > /dev/null; then
    echo "⚠️  Nginx ya está corriendo. Reiniciando..."
    sudo nginx -s stop
    sleep 2
fi

# Iniciar nginx
sudo nginx

# Verificar que nginx está corriendo
if pgrep nginx > /dev/null; then
    echo "✅ Nginx iniciado exitosamente en puerto 8080"
    echo "🌐 Accede a tu aplicación en: http://localhost:8080"
else
    echo "❌ Error al iniciar nginx"
    echo "📋 Verificando logs..."
    sudo tail -n 10 /var/log/nginx/error.log
fi

# Mostrar el estado de los puertos
echo "📊 Puertos en uso:"
ss -tlnp | grep :8080 || echo "Puerto 8080 no está en uso"