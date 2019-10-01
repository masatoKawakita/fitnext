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
/*!
 * jQuery Raty - A Star Rating Plugin
 *
 * The MIT License
 *
 * author:  Washington Botelho
 * github:  wbotelhos/raty
 * version: 2.9.0
 *
 */
//
//= require popper
//= require jquery3
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).on("turbolinks:load", () => {
  jQuery(document).ready(function($){
      $(window).scroll(function() {
      if ($(window).scrollTop() > 100 ){
      $('.top-header').addClass('shows');
        } else {
        $('.top-header').removeClass('shows');
      };
    });
    });
  jQuery('.scroll').on('click', function(e){
      e.preventDefault()
    jQuery('html, body').animate({
        scrollTop : jQuery(this.hash).offset().top
      }, 1500);
  });
});
