/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let map = L.map('DivMapa').setView([-32.308252103359365, -58.07829348990573], 12);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

document.querySelectorAll('.coord-link').forEach(function (link) {
    link.addEventListener('click', function (e) {
        e.preventDefault();
        let lat =this.getAttribute('data-lat');
        let lng =this.getAttribute('data-lng');
        let zoom = this.getAttribute('data-zoom');
        let marker = L.marker([lat, lng]).addTo(map);
        map.flyTo([lat, lng],zoom);
    })
})