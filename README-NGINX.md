# 🚀 Codespace con Nginx

Este repositorio está configurado para levantar automáticamente un servidor nginx en GitHub Codespaces.

## 🎯 ¿Qué incluye?

- **Nginx** configurado automáticamente en el puerto 8080
- **Sitio web de ejemplo** con HTML, CSS y JavaScript
- **Configuración DevContainer** optimizada para desarrollo web
- **Scripts de inicio automático**

## 🚀 Cómo usar

### Opción 1: Crear un nuevo Codespace
1. Ve a este repositorio en GitHub
2. Haz click en el botón verde "Code"
3. Selecciona "Codespaces"
4. Click en "Create codespace on main" (o la rama que prefieras)
5. Espera a que se configure automáticamente
6. ¡Nginx se iniciará automáticamente en el puerto 8080!

### Opción 2: Desde VS Code
1. Instala la extensión "GitHub Codespaces"
2. Abre la paleta de comandos (Ctrl+Shift+P)
3. Busca "Codespaces: Create New Codespace"
4. Selecciona este repositorio

## 🔧 Configuración

### Estructura del proyecto
```
.
├── .devcontainer/
│   ├── .devcontainer.json  # Configuración del container
│   ├── nginx.conf          # Configuración de nginx
│   ├── setup.sh           # Script de configuración inicial
│   └── start-nginx.sh     # Script de inicio de nginx
├── public/                 # Archivos web servidos por nginx
│   ├── index.html
│   ├── styles.css
│   └── script.js
└── README.md
```

### Puertos
- **8080**: Servidor web nginx (automáticamente reenviado)

### Variables de entorno
- `NGINX_PORT=8080`: Puerto donde nginx escucha

## 🛠️ Comandos útiles

### Gestión de nginx
```bash
# Verificar estado
sudo nginx -t

# Reiniciar nginx
sudo nginx -s reload

# Parar nginx
sudo nginx -s stop

# Iniciar nginx manualmente
sudo nginx

# Ver logs
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log
```

### Desarrollo
```bash
# Ver qué está corriendo en el puerto 8080
ss -tlnp | grep :8080

# Verificar procesos de nginx
ps aux | grep nginx
```

## 📁 Archivos de configuración

### `.devcontainer/.devcontainer.json`
Configuración principal del DevContainer que incluye:
- Imagen base con nginx
- Configuración de puertos
- Scripts de inicio automático
- Extensiones recomendadas

### `.devcontainer/nginx.conf`
Configuración personalizada de nginx que incluye:
- Servidor en puerto 8080
- Documentos servidos desde `./public/`
- Configuración de caché para assets
- Headers de seguridad básicos

## 🎨 Personalización

### Cambiar el contenido web
Edita los archivos en la carpeta `public/`:
- `index.html`: Estructura HTML
- `styles.css`: Estilos CSS
- `script.js`: Funcionalidad JavaScript

### Modificar configuración de nginx
Edita `.devcontainer/nginx.conf` y ejecuta:
```bash
sudo nginx -s reload
```

### Agregar más puertos
Modifica `forwardPorts` en `.devcontainer/.devcontainer.json`

## 🐛 Troubleshooting

### Nginx no inicia
```bash
# Verificar configuración
sudo nginx -t

# Ver logs de error
sudo tail -f /var/log/nginx/error.log

# Reiniciar manualmente
./.devcontainer/start-nginx.sh
```

### Puerto 8080 no responde
```bash
# Verificar que nginx está corriendo
ps aux | grep nginx

# Verificar que el puerto está abierto
ss -tlnp | grep :8080

# Verificar que el puerto está siendo reenviado
# (En VS Code, ve a la pestaña "Ports")
```

## 📝 Notas

- Nginx se inicia automáticamente cuando se abre el Codespace
- Los archivos se sirven desde la carpeta `public/`
- El puerto 8080 se reenvía automáticamente para acceso externo
- Los logs se encuentran en `/var/log/nginx/`

## 🤝 Contribuir

1. Fork este repositorio
2. Crea una rama para tu feature (`git checkout -b feature/amazing-feature`)
3. Commit tus cambios (`git commit -m 'Add amazing feature'`)
4. Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` para más detalles.

---

¡Disfruta desarrollando con nginx en Codespaces! 🎉