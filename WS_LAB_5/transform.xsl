<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:trav="www.abc.com/trav">

  <!-- Root template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Travel Booking Details</title>
        <style>
        body {
          font-family: Arial, sans-serif;
          margin: 20px;
        }
        .main {
          margin-top: 98px;
        }
        h1 {
          text-align: center;
          color: #f11f1f;
        }
        h2 {
          color: #045c7d;
        }
        table {
          width: 100%;
          border-collapse: collapse;
          margin: 20px 0;
        }
        th, td {
          border: 1px solid #ddd;
          padding: 8px;
          text-align: left;
        }
        th {
          background-color: #f2f2f2;
          color: black;
        }
        td:hover { background-color: #cff6f0; }
        th:hover { background-color: #b1fcb5; }

        @media (max-width: 768px) {
          .main {
            margin-top: 90px;
          }
          h1 {
            font-size: 1.5rem;
          }
        }
        </style>

        <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous"
  />
  <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"
  ></script>
      </head>
      <body>

        <nav class="navbar navbar-expand-sm bg-success fixed-top">
          <div class="container">
              <a href="#" class="navbar-brand text-dark display-5 fw-bold p-4">TraveleX</a>
              <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#n_bar" aria-controls="navbarNavAltMarkup" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="n_bar">
                  <ul class="navbar-nav">
                      <li class="nav-item active"><a class="nav-link text-dark" href="transform.xsl">Booking</a></li>
                      <li class="nav-item"><a class="nav-link text-dark" href="#">Home</a></li>
                      <li class="nav-item"><a class="nav-link text-dark" href="#">Book</a></li>
                      <li class="nav-item"><a class="nav-link text-dark" href="#">Login</a></li>
                      <li class="nav-item"><a class="nav-link text-dark" href="#">SignUp</a></li>
                      <li class="nav-item"><a class="nav-link text-dark" href="#">About</a></li>
                  </ul>
              </div>
          </div>
      </nav>
     <div class="main">
        <h1> Your Travel Booking Information</h1>
        
        <!-- Destination Information -->
        <h2>Destination-Flight</h2>
        <table>
          <tr>
            <th>City</th>
            <th>Country</th>
            <th>Airline</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>
            <th>Amount</th>
            <th>Stay(Hotel)</th>
            <th>Hotel Price</th>
          </tr>
          <xsl:for-each select="travel/loc">
            <tr>
              <td><xsl:value-of select="destination/city"/></td>
              <td><xsl:value-of select="destination/country"/></td>
              <td><xsl:value-of select="flight/airline"/></td>
            <td><xsl:value-of select="flight/departure"/></td>
            <td><xsl:value-of select="flight/arrival"/></td>
            <td><xsl:value-of select="flight/amount"/></td>
            <td><xsl:value-of select="destination/hotel"/></td>
            <td><xsl:value-of select="destination/hotel_rent"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- Hotel Information -->
        <h2>Hotel</h2>
        <table>
          <tr>
            <th>Name</th>
            <th>Stars</th>
            <th>Price (per night)</th>
          </tr>
          <xsl:for-each select="travel/hotels">
            <tr>
              <td><xsl:value-of select="hotel/name"/></td>
              <td><xsl:value-of select="hotel/stars"/></td>
              <td><xsl:value-of select="hotel/price"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        
        <!-- Flight Information -->
        <!-- <h2>Flight</h2>
        <table>
          <tr>
            <th>Airline</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>
            <th>Amount</th>
          </tr>
          <tr>
            <td><xsl:value-of select="travel/flight/airline"/></td>
            <td><xsl:value-of select="travel/flight/departure"/></td>
            <td><xsl:value-of select="travel/flight/arrival"/></td>
            <td><xsl:value-of select="travel/flight/amount"/></td>
          </tr>
        </table> -->
        
        <!-- Bus Information -->
        <h2>Bus</h2>
        <table>
          
          <tr>
            <th>Boarding</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>
            <th>Amount</th>
            <th>Dropping</th>
          </tr>
          <xsl:for-each select="travel/loc">
          <tr>
            <td><xsl:value-of select="bus/boarding"/></td>
            <td><xsl:value-of select="bus/departure"/></td>
            <td><xsl:value-of select="bus/arrival"/></td>
            <td><xsl:value-of select="bus/amount"/></td>
            <td><xsl:value-of select="bus/dropping"/></td>
          </tr>
        </xsl:for-each>
        </table>
      </div>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
