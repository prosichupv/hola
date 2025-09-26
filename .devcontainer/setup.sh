#!/bin/bash

# Script de configuración inicial para nginx en codespaces
echo "🔧 Configurando nginx para codespaces..."

# Instalar nginx si no está instalado
if ! command -v nginx &> /dev/null; then
    echo "📦 Instalando nginx..."
    sudo apt update
    sudo apt install -y nginx
fi

# Crear directorios necesarios
sudo mkdir -p /var/log/nginx
sudo mkdir -p /etc/nginx/sites-available
sudo mkdir -p /etc/nginx/sites-enabled

# Copiar la configuración personalizada
sudo cp /workspaces/hola/.devcontainer/nginx.conf /etc/nginx/sites-available/default
sudo ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Verificar que el directorio público existe
if [ ! -d "/workspaces/hola/public" ]; then
    echo "⚠️  Creando directorio público..."
    mkdir -p /workspaces/hola/public
fi

# Cambiar permisos
sudo chown -R $USER:$USER /workspaces/hola/public
sudo chmod -R 755 /workspaces/hola/public

# Verificar la configuración de nginx
echo "✅ Verificando configuración de nginx..."
sudo nginx -t

echo "🎉 Configuración inicial completada!"