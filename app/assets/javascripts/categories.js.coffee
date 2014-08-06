carousel = ->
  $('.carousel').carousel();

tree = ->
  $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Zweig schließen');
  $('.tree li.parent_li > span').click (e) ->
    children = $(this).parent('li.parent_li').find(' > ul > li');
    if children.is(":visible") 
      children.hide('fast')
      $(this).attr('title', 'Zweig öffnen').find(' > i').addClass('fa-plus').removeClass('fa-minus')
    else
      children.show('fast')
      $(this).attr('title', 'Zweig schließen').find(' > i').addClass('fa-minus').removeClass('fa-plus')

  e.stopPropagation();



ready = ->
  carousel();
  tree();

$(document).ready(ready);
$(document).on('page:load', ready);

