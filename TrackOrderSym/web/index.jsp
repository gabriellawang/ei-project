<%-- 
    Document   : gpstrack
    Created on : Mar 29, 2016, 9:02:01 PM
    Author     : Ace830
--%>

<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.InputMismatchException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>

<html>
    <head>
        <meta charset="utf-8">
        <title>Marker Animations</title>
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #map {
                height: 100%;
            }
        </style>
    </head>
    <body>
        <div id="map"></div>
        <script>
            <%
                Scanner fileIn = null;
                File file;
                double x = 0;
                double y = 0;
                try {
                    file = new File("C:\\EI\\test.csv");
                    fileIn = new Scanner(file);
                    fileIn.useDelimiter(",|\r\n");
                    while (fileIn.hasNext()) {
                        try {
                            x = fileIn.nextDouble();
                            y = fileIn.nextDouble();
                        } catch (InputMismatchException e) {
                            throw e;
                        }
                    }

            %>

            // The following example creates a marker in Stockholm, Sweden using a DROP
            // animation. Clicking on the marker will toggle the animation between a BOUNCE
            // animation and no animation.

            var marker;
            var param1var1 ="<%=x%>"; 
            var param1var2 ="<%=y%>"; 
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 13,
                    center: {lat: parseFloat(param1var1), lng: parseFloat(param1var2)}
                });

                marker = new google.maps.Marker({
                    map: map,
                    draggable: true,
                    animation: google.maps.Animation.DROP,
                    position: {lat: parseFloat(param1var1), lng: parseFloat(param1var2)}
                });
                marker.addListener('click', toggleBounce);
            }

            function toggleBounce() {
                if (marker.getAnimation() !== null) {
                    marker.setAnimation(null);
                } else {
                    marker.setAnimation(google.maps.Animation.BOUNCE);
                }


            }
            
            <%



                } catch (FileNotFoundException e) {
                    throw e;
                } finally {
                    if (fileIn == null) {

                    }
                    fileIn.close();
                }
            %>
        </script>

        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiV92CJb0bdgykIBPB8y2ES_czHC9l504&callback=initMap">
        </script>
        <meta http-equiv="refresh" content="6; URL=http://localhost:8084/GpsSimulate/index.jsp">
    </body>
</html>