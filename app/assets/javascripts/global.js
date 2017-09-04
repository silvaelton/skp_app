$(document).on('turbolinks:load', function() {
  $('.ui.sidebar').sidebar({transition: 'overlay'})
  $('.ui.dropdown').dropdown();
  $('.accordion').accordion();


  // masks

  $('.date').mask('00/00/0000');
  $('.cpf').mask('000.000.000-00', {reverse: true});
  $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
  $('.coin').mask('###000.00', {reverse: true});
})
