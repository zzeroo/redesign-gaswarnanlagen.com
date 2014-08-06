hello = ->
  alert("Hello You!");

goodby = ->
  alert("Good by");


carousel = ->
  $('.carousel').carousel()
# 
# $(document).ready(carousel)
# $(document).on('page:load', carousel)

ready = ->
  hello();
  goodby();

$(document).ready(ready);
$(document).on('page:load', ready);

