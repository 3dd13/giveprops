# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#register-form").hide()
  $("#register-btn").click ->
    $("#facebook-form").hide()
    $("#register-form").toggle()

  $("#facebook-form").hide()
  $("#facebook-btn").click ->
    $("#register-form").hide()
    $("#facebook-form").toggle()