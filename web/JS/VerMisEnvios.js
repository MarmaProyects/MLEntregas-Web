/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let precio;

document.addEventListener('DOMContentLoaded', function () {
    // Configura la credencial de prueba
    document.querySelectorAll('button[data-envio-id]').forEach(function (button) {
        button.addEventListener('click', function () {
            let idEnvio = this.getAttribute('data-target-form');
            precio = idEnvio;
            mostrarBotonPaypal();
        });
    });
});

function mostrarBotonPaypal() {
    paypal.Button.render({
        env: 'sandbox', // sandbox | production

        // PayPal Client IDs - replace with your own
        // Create a PayPal app: https://developer.paypal.com/developer/applications/create
        client: {
            sandbox: 'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
            production: '<insert production client id>'
        },

        // Show the buyer a 'Pay Now' button in the checkout flow
        commit: true,

        // payment() is called when the button is clicked
        payment: function (data, actions) {
            // Make a call to the REST api to create the payment
            return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: {total: '2', currency: 'USD'}
                        }
                    ]
                }
            });
        },

        // onAuthorize() is called when the buyer approves the payment
        onAuthorize: function (data, actions) {
            // Make a call to the REST api to execute the payment
            return actions.payment.execute().then(function () {
                const baseUrl = window.location.protocol + "//" + window.location.hostname + ":" + window.location.port;
                fetch(baseUrl + "/VerMisEnvios?idEnvio=2&tipoPago=Credito", {
                    method: 'POST'
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    window.location.href = baseUrl + "/VerMisEnvios";
                });
            });
        }

    }, '#paypal-button-container');
}


