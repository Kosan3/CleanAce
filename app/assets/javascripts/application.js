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
        autoplaySpeed: 2500,
        prevArrow:'<div class="prev"><i class="fas fa-angle-left" id="prev-arrow"></i></div>',
        nextArrow:'<div class="next"><i class="fas fa-angle-right" id="next-arrow"></i></div>',
        pauseOnHover: false
    });
});

$(function(){
  $('#top-images').mouseover(function(){
    $('#top-images').css({
      'opacity': '0.6',
      'transition-duration': '0.5s'
    });
    $('#prev-arrow').show();
    $('#next-arrow').show();
  });
  $('#top-images').mouseout(function(){
    $('#top-images').css({
      'opacity': '1',
      'transition-duration': '0.5s'
    });
    $('#prev-arrow').hide();
    $('#next-arrow').hide();
  });
});


function initMap(){
  var map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 36.161411, lng: 139.507679 },
    zoom: 17
  });
};

$(function(){
  $('#top_back a').on('click', function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

$(function(){
  $('.window_alert').on('click', function() {
    window.alert('本来であれば、ここで他アプリに偏移します。');
  });
});