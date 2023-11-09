/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {
    // Configura la credencial de prueba
    MercadoPago.setPublishableKey('TEST-8ce2d69e-43f0-446c-a482-75eb6c1d3fb3');

    // Crea una preferencia de pago
    const preference = {
        items: [
            {
                title: 'Producto de prueba',
                quantity: 1,
                currency_id: 'ARS', // Moneda (en este caso, pesos argentinos)
                unit_price: 100 // Precio del producto
            }
        ]
    };

    MercadoPago.preferences.create(preference)
        .then(response => {
            console.log(response);
        })
        .catch(error => {
            console.log(error);
        });
});

