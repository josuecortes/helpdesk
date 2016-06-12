// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require bootstrap-table
//= require bootstrap
//= require chart-data
//= require chart.min
//= require easypiechart-data
//= require easypiechart
//= require html5shiv.min
//= require lumino.glyphs
//= require respond.min
//= require jquery-1.11.1.min

$(document).ready(function () {
      $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  });