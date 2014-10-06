# Fixme: funktioniert nicht!
$(document).ready ->
  $('#fileupload').fileupload()


jQuery ->
  $('.hidden-doc').siblings('p').hover ->
    $(this).parent().find('.hidden-doc').fadeIn()
  , ->
    $(this).parent().find('.hidden-doc').fadeOut()

