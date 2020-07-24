// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(function() {
    $('#top-images').slick({
        dots: true,
        autoplay: true,
        dots: true,
        infinite: true,
        speed: 1500,
        fade: true,
        cssEase: 'linear',
        prevArrow:'<div class="prev"><i class="fas fa-angle-left" id="prev-arrow"></i></div>',
        nextArrow:'<div class="next"><i class="fas fa-angle-right" id="next-arrow"></i></div>'
    });
});


function initMap(){
  let map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 36.161411, lng: 139.507679 },
    zoom: 17
  });
};