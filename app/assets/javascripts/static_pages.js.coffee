# Zeichnet die Karte in das map div von `/contact`
# initialize the map on the 'map' div
# with the given map ID, center, and zoom

# Javascript document ready trick stolen here: https://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links
ready = ->
  map = L.map('map').setView([48.78246648933948,9.36416392326355], 12)
  L.tileLayer('https://{s}.tiles.mapbox.com/v3/service.hk1c7i1j/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="https://openstreetmap.org">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://mapbox.com">Mapbox</a>',
      maxZoom: 18
  }).addTo(map)
  marker = L.marker([48.81246648933948,9.31416392326355]).addTo(map)
  marker.bindPopup("<b>RA-GAS GmbH</b><br>
  Rudolf-Diesel-Str. 22 a-d<br>
  <br>
  71394 Kernen im Remstal<br>
  <b>Fon</b> +49(0) 7151 930440<br>
  <b>Fax</b> +49(0) 7151 930443<br>
  <b>E-Mail</b> <a href='mailto:info@gaswarnanlagen.com'>info@gaswarnanlagen.com</a>
  ").openPopup();


$(document).ready(ready)
$(document).on('page:load', ready)



# toggle contact div on contact page
toggle = ->
  $("button").click ->
    $("#contact").toggle()

$(document).on('page:load', toggle)
