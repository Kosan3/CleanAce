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
//= require jquery
//= require jquery3

//= require popper
//= require bootstrap-sprockets

//= require moment
//= require moment/ja.js

//= require tempusdominus-bootstrap-4.js
//= require rails-ujs
//= require activestorage
//= require_tree .

$(function () {
  var today = new Date();
  if ((today.getDay() === 5) || (today.getDay() === 6) || (today.getDay() === 0)) {
    today.setDate(today.getDate() + 3);
    $('.datepicker').datetimepicker({
    daysOfWeekDisabled: [0],
    format: 'L',
    minDate: today.toLocaleDateString(),
    maxDate: '2020/10/1',
    defaultDate: today.toLocaleDateString()
  });
  } else {
    today.setDate(today.getDate() + 2);
    $('.datepicker').datetimepicker({
    daysOfWeekDisabled: [0],
    format: 'L',
    minDate: today.toLocaleDateString(),
    maxDate: '2020/10/1',
    defaultDate: today.toLocaleDateString()
  });
  }
});

// スライド
$(function() {
    $('#top-images').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 2500,
        prevArrow:'<div class="slide_prev"><i class="fas fa-angle-left" id="prev-arrow"></i></div>',
        nextArrow:'<div class="slide_next"><i class="fas fa-angle-right" id="next-arrow"></i></div>',
        pauseOnHover: false
    });
});

// スライドの矢印をアレンジ
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

// Google Map
function initMap(){
  var map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 36.161411, lng: 139.507679 },
    zoom: 17
  });
};

// 最上部に戻るボタン
$(function(){
  $('#top_back a').on('click', function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

// アラート
$(function(){
  $('.window_alert').on('click', function() {
    window.alert('本来であれば、ここで他アプリに偏移します。');
  });
});

// 要素を点滅
$(function() {
  $('.kanyu').fadeOut(500, function() {
    $(this).fadeIn(500, function() {
      $(this).fadeOut(500, function() {
        $(this).fadeIn(500, function() {
          $(this).fadeOut(500, function() {
            $(this).fadeIn(500)
          });
        });
      });
    });
  });
});

$(function() {
  $('.back_button').on('mouseover', function() {
    $(this).css({'color':'black'});
  });
});



$(function() {
  $('input:radio[name="designated_key"]').change(function() {
    var a = $('input:radio[name="designated_key"]:checked').val();
    if (a === 'no_designated') {
      $('#date-field').css({'display':'none'});
    } else if (a === 'designated') {
      $('#date-field').css({'display':'block'})
    }
  });
});

