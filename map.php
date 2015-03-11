<!DOCTYPE html>
<html>
  <head>
    <style type="text/css">
      html, body, #map-canvas { height: 100%; margin: 0; padding: 0;  width: 500px; height: 400px;}
      }
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApOJOQG01-hx1Ik41Zw41Lb2oizvdK7RE">
    </script>
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: { lat: 55.946076, lng: -3.200534},
          zoom: 15
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
<div id="map-canvas"></div>
  </body>
</html>
