<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="J39758_CO5027_ASG1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GoogleMap" runat="server">
<div id="map">
    <script>
      var map;
      function initMap() {
          
              
              var storeLatLng = { lat: 4.903997, lng: 114.926075 };
              var map = new google.maps.Map(document.getElementById('map'), {
                  zoom: 19,
                  center: storeLatLng
              });
              
              var contentString1 = '<div id="content">' +
                  '<div id="siteNotice">' +
                  '</div>' +
                  '<h1 id="Location_Head" class="Location_Head"> Seri Q-Lap Mall, Kg Kiulap, Bandar Seri Begawan BE1518, Brunei</h1>' +
                  '<div id="bodyContent">' +
                  '<p><b>The store located here</b></p>' +
                  '</div>' +
                  '</div>';
              
              var infowindow1 = new google.maps.InfoWindow({
                  content: contentString1
              });
             
             
              var marker1 = new google.maps.Marker({
                  position: storeLatLng,
                  map: map,
                  title: 'The Seri Q-Lap Mall'
              });
              marker1.addListener('click', function () {
                  infowindow1.open(map, marker1);
              });
      }
    </script>

    
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChbm1px4BV4DvMIDJOD0O55T3iNhleKGM&callback=initMap"
  type="text/javascript"></script>
</div>

</asp:Content>
