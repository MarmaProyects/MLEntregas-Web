/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {

    let map = L.map('DivMapa').setView([-32.308252103359365, -58.07829348990573], 12);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    /*Porvenir*/
    L.circle([-32.394138571410764, -57.968147645564244], {radius: 800}).addTo(map);
    /*Esperanza*/
    L.circle([-32.352018863236104, -57.95293900242489], {radius: 800}).addTo(map);
    /*Constancia*/
    L.circle([-32.206848031246125, -58.00667987754964], {radius: 800}).addTo(map);


    document.querySelectorAll('.coord-link').forEach(function (link) {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            let lat = this.getAttribute('data-lat');
            let lng = this.getAttribute('data-lng');
            let zoom = this.getAttribute('data-zoom');
            let marker = L.marker([lat, lng]).addTo(map);
            map.flyTo([lat, lng], zoom);



        })
    })
});