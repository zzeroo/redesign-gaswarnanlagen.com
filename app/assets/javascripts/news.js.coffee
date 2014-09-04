
datepicker = ->
  $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd'})
  
  
ready = ->
  datepicker();

$(document).ready(ready);
$(document).on('page:load', ready);

