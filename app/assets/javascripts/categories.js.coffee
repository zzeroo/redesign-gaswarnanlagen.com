# Images carusel
# TODO: Wieder einbinden, zur Zeit nicht in der Benutzung
carousel = ->
  $('.carousel').carousel();

# Javascript logic for categories -> sub categories managment
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

# Close all sub categories
close = ->
  $('.tree li.parent_li > span > i').parent().effect( "highlight", { color: "#FFE700" }, 2000 );
  $('.tree li.parent_li').find(' > ul > li').delay(1000).hide('slow')
  $('.tree li.parent_li > span').find(' > i').addClass('fa-plus').removeClass('fa-minus')



# Ready function, called if document is ready
# This function and the two next are needed because the turbolinks js
ready = ->
  carousel();
  tree();
  close();

# jQuery event document.ready
$(document).ready(ready);
# jQuery event for page sucessfully loaded
$(document).on('page:load', ready);

