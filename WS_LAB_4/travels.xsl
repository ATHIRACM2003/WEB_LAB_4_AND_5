<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:html="http://www.w3.org/1999/xhtml">

  <!-- Root template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Booking Information</title>
        <style>
          h2 {
            text-align: center;
          }
          table {
            width: 100%;
            border-collapse: collapse;
          }
          th, td {
            border: 1px solid black;
            padding: 6px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
          .map {
            width: 100%;
            height: 500px; /* Increased height for better visibility */
            margin-top: 20px; /* Add margin for better spacing */
          }
        </style>

        <!-- Load Leaflet CSS -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <!-- Load Leaflet JavaScript -->
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
      </head>
      <body onload="initMap()">
        <h2>Travel Booking</h2>
        <table>
          <tr>
            <th>Place Name</th>
            <th>City</th>
            <th>Country</th>
            <th>Amount</th>
            <th>Mode</th>
            <th>Date</th>
            <th>Native Food</th>
            <th>Popular Food</th>
            <th>Min Temp</th>
            <th>Max Temp</th>
            <th>Humidity</th>
            <th>Native Lang</th>
            <th>Popular Lang</th>
          </tr>
          
          <!-- Loop through each place -->
          <xsl:for-each select="booking/place">
            <tr>
              <!-- Location details -->
              <td><xsl:value-of select="location/name"/></td>
              <td><xsl:value-of select="location/city"/></td>
              <td><xsl:value-of select="location/country"/></td>
              <td><xsl:value-of select="location/amount"/></td>

              <!-- Mode -->
              <td><xsl:value-of select="mode"/></td>

              <!-- Date -->
              <td>
                <xsl:value-of select="date/dnum"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="date/day"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="date/month"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="date/year"/>
              </td>

              <!-- Food -->
              <td><xsl:value-of select="food/native"/></td>
              <td><xsl:value-of select="food/popular"/></td>

              <!-- Weather -->
              <td><xsl:value-of select="weather/mintemp"/></td>
              <td><xsl:value-of select="weather/maxtemp"/></td>
              <td><xsl:value-of select="weather/humidity"/></td>

              <!-- Language -->
              <td><xsl:value-of select="language/natlang"/></td>
              <td><xsl:value-of select="language/poplang"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <h2>Route Map between Delhi and Agra</h2>
        <div id="map" class="map"></div>

        <script>
          function initMap() {
            // Initialize map centered between Delhi and Agra
            var map = L.map('map').setView([27.84, 77.57], 7); // Centered between Delhi and Agra

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
              maxZoom: 19,
              attribution: '© OpenStreetMap contributors'
            }).addTo(map);

            // Define the coordinates for the route
            var routeCoordinates = [
              [28.7041, 77.1025], // Delhi
              [27.1751, 78.0421]  // Agra
            ];

            // Draw the route on the map with better visibility
            var polyline = L.polyline(routeCoordinates, { color: 'blue', weight: 5 }).addTo(map);
            map.fitBounds(polyline.getBounds()); // Fit map to the route

            // Add markers for each location
            L.marker(routeCoordinates[0]).addTo(map).bindPopup('Delhi').openPopup();
            L.marker(routeCoordinates[1]).addTo(map).bindPopup('Agra').openPopup();
          }
        </script>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
