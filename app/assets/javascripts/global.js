$(document).on('turbolinks:load', function() {
  $('.visible.example .ui.sidebar').sidebar({context: '.visible.example .bottom.segment'})
  $('.ui.dropdown').dropdown();

  $('.accordion').accordion();
})
