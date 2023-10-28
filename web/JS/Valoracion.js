/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function () {
    const estrellas = document.querySelectorAll("input[type=radio]");
    const ratingText = document.getElementById("rating-value");
    const puntaje_tomado = document.getElementById("input_puntaje");

    estrellas.forEach(estrella => {
        estrella.addEventListener("change", function () {
            const rating = this.getAttribute("data-value");
            ratingText.textContent = rating;
            puntaje_tomado.value = rating;
        });
    });
})