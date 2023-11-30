/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let precio;
let idEnvio;
let amount;
document.addEventListener('DOMContentLoaded', function () {
    // Configura la credencial de prueba
    document.querySelectorAll('button[data-envio-id]').forEach(function (button) {
        button.addEventListener('click', function () {
            idEnvio = this.getAttribute('data-target-form');
            precio = this.getAttribute('data-envio-precio');
            amount = precio / 40;
        });
    });
    const modal = document.getElementsByClassName("wallet_container_form");
    const handleSubmit = async function (e) {
        e.preventDefault();
        createPreferenceId();
    }
    for (var i = 0; i < modal.length; i++) {
        modal[i].addEventListener("submit", handleSubmit)
    }
    mostrarBotonPaypal()

    //Copiar codigo rastreo por cada boton de copiar CR
    document.querySelectorAll('button[boton-copiar-CR]').forEach(function (button) {
        button.addEventListener('click', function () {
            let idBoton = this.getAttribute('boton-copiar-CR');
            let input = document.getElementById("InputCodigoRastreo_" + this.getAttribute('boton-copiar-CR'));
            let imagen = document.getElementById("imagenCopiar_" + idBoton);
            let imagenOriginal = imagen.src;
            imagen.src = "Images/SuccesCopiarIcon.png";
            copiarCRClipboard(input);
            setTimeout(function () {
                imagen.src = imagenOriginal;
            }, 2000);
        });
    });


});

function createPreferenceId() {
    const url = 'https://api.mercadopago.com/checkout/preferences';

    let paymentBrick_container = document.getElementById('paymentBrick_container');
    const mp = new MercadoPago('TEST-8ce2d69e-43f0-446c-a482-75eb6c1d3fb3', {
        locale: 'es-AR'
    });
    const data = {
        items: [
            {
                id: idEnvio,
                title: 'Envio de un paquete',
                quantity: 1,
                unit_price: parseFloat(precio),
            },
        ],
    };

    const options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer TEST-5810735343549411-101921-8d933dd4ab90951e257e865e4a470ec4-385892004',
        },
        body: JSON.stringify(data),
    };
    if (!paymentBrick_container.firstChild) {
        fetch(url, options)
                .then(response => response.json())
                .then(data => {
                    mp.bricks().create("payment", "paymentBrick_container", {
                        initialization: {
                            amount: parseFloat(precio),
                            preferenceId: data.id,
                        },
                        customization: {
                            paymentMethods: {
                                ticket: "all",
                                creditCard: "all",
                                debitCard: "all",
                                mercadoPago: "all",
                            },
                        },
                        callbacks: {
                            onReady: () => {
                            },
                            onSubmit: ({ selectedPaymentMethod, formData }) => {
                                let paymentMethod;
                                if (selectedPaymentMethod == 'debit_card') {
                                    paymentMethod = 'Debito';
                                } else if (selectedPaymentMethod == 'credit_card') {
                                    paymentMethod = 'Credito';
                                } else {
                                    paymentMethod = 'Efectivo';
                                }
                                return new Promise((resolve, reject) => {
                                    const baseUrl = window.location.protocol + "//" + window.location.hostname + ":" + window.location.port;
                                    fetch(baseUrl + "/VerMisEnvios?idEnvio=" + idEnvio + "&tipoPago=" + paymentMethod, {
                                        method: 'POST'
                                    }).then(response => {
                                        resolve();
                                        if (!response.ok) {
                                            throw new Error('Network response was not ok');
                                        }
                                        window.location.href = baseUrl + "/VerMisEnvios";
                                    });
                                });
                            },
                            onError: (error) => {
                                // callback llamado para todos los casos de error de Brick
                                console.error(error);
                            },
                        },
                    });
                })
                .catch(error => console.error('Error:', error));
    }
}

function mostrarBotonPaypal() {
    paypal.Button.render({

        env: 'sandbox', // sandbox | production

        // PayPal Client IDs - replace with your own
        // Create a PayPal app: https://developer.paypal.com/developer/applications/create
        client: {
            sandbox: 'AfhCkQdyLb3C1vJmviZAorwxVG2BZ5BNaVLUYXACzxuTzYI4SC9gUD6r267IdmSa1PWvjrD56sPASmSN',
            production: '<insert production client id>'
        },
        style: {
            size: 'medium', // small | medium | large | responsive 
            color: 'gold'      // gold | blue | silver | black
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
                            amount: {total: precio, currency: 'USD'}
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
                fetch(baseUrl + "/VerMisEnvios?idEnvio=" + idEnvio + "&tipoPago=Credito", {
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

    return true;
}

function copiarCRClipboard(input) {
    const tempInput = document.createElement("input");
    tempInput.type = "text";  // Cambiar el tipo de oculto a texto
    tempInput.value = input.value;
    document.body.appendChild(tempInput);
    // Seleccionar y copiar el texto
    tempInput.select();
    tempInput.setSelectionRange(0, 99999); // Para celulares
    document.execCommand("copy");
    // Eliminar el input clonado
    document.body.removeChild(tempInput);
}


