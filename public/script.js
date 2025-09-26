// Función para mostrar la fecha actual
function mostrarFecha() {
    const ahora = new Date();
    const opciones = { 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    };
    document.getElementById('fecha').textContent = ahora.toLocaleDateString('es-ES', opciones);
}

// Función para recargar la página
function recargarPagina() {
    window.location.reload();
}

// Función para mostrar información del navegador
function mostrarInfo() {
    const info = {
        navegador: navigator.userAgent,
        idioma: navigator.language,
        plataforma: navigator.platform,
        cookies: navigator.cookieEnabled ? 'Habilitadas' : 'Deshabilitadas',
        ubicacion: window.location.href
    };
    
    let mensaje = '🌐 Información del navegador:\n\n';
    for (const [clave, valor] of Object.entries(info)) {
        mensaje += `${clave}: ${valor}\n`;
    }
    
    alert(mensaje);
}

// Función que se ejecuta al cargar la página
document.addEventListener('DOMContentLoaded', function() {
    mostrarFecha();
    
    // Actualizar la fecha cada minuto
    setInterval(mostrarFecha, 60000);
    
    // Agregar efecto de hover a las tarjetas
    const tarjetas = document.querySelectorAll('.welcome-card, .info-card');
    tarjetas.forEach(tarjeta => {
        tarjeta.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
            this.style.transition = 'transform 0.3s ease';
        });
        
        tarjeta.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
    
    console.log('🚀 Nginx está funcionando correctamente en Codespaces!');
    console.log('Puerto: 8080');
    console.log('Fecha de carga:', new Date().toISOString());
});