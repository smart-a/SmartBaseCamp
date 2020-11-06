import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'
flatpickr(".datepicker", {

});



// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks 
//= require popper
//= require bootstrap
//= require flatpickr
// Locales can be included like so:
//= require flatpickr/l10n/da
//= require_tree .
//include JQuery framework


//include JQuery framework
var jquery = require('jquery')

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jquery;
window.$ = window.jQuery = jquery;

$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $('.exp_date').flatpickr();
    
});

