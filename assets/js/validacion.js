/**
 * Validación personalizada del lado del cliente.
 * Cumple: manipulación DOM, manejo de eventos, control de errores.
 */
document.addEventListener('DOMContentLoaded', function() {
    const formularioInicio = document.getElementById('formulario-login');

    if (formularioInicio) {
        formularioInicio.addEventListener('submit', function(evento) {
            if (!validarCamposInicio()) {
                evento.preventDefault(); // Bloquea envío si hay errores
            }
        });
    }
});

function validarCamposInicio() {
    const campoCorreo = document.getElementById('correo');
    const campoContrasena = document.getElementById('contrasena');
    let hayErrores = false;

    limpiarMensajes();

    if (!campoCorreo.value.trim().includes('@') || campoCorreo.value.length < 5) {
        mostrarError(campoCorreo, 'El formato del correo electrónico es inválido.');
        hayErrores = true;
    }

    if (campoContrasena.value.length < 6) {
        mostrarError(campoContrasena, 'La contraseña debe tener al menos 6 caracteres.');
        hayErrores = true;
    }

    return !hayErrores;
}

function mostrarError(campo, mensaje) {
    const etiquetaError = document.createElement('span');
    etiquetaError.classList.add('mensaje-error');
    etiquetaError.textContent = mensaje;
    etiquetaError.style.color = '#dc3545';
    etiquetaError.style.fontSize = '0.85rem';
    etiquetaError.style.marginTop = '0.25rem';
    etiquetaError.style.display = 'block';

    campo.parentNode.appendChild(etiquetaError);
    campo.classList.add('borde-invalido');
}

function limpiarMensajes() {
    document.querySelectorAll('.mensaje-error').forEach(el => el.remove());
    document.querySelectorAll('.borde-invalido').forEach(el => el.classList.remove('borde-invalido'));
}