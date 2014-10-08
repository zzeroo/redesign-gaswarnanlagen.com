#
# jquery-file-upload stuff

# Ajax delete objects
# http://stackoverflow.com/questions/1234432/rails-destroy-confirm-with-jquery-ajax
# Mike's answer
jQuery ->
  $('a.delete').click ->
    if(confirm("Sind Sie sicher?"))
      $(this).closest('div').delay().fadeOut()


# Piwik Turobo Links helper
# FIXME: Is this working?
# http://reed.github.io/turbolinks-compatibility/piwik.html
$(document).on 'page:change', ->
  if window._paq?
    _paq.push ['trackPageview']
  else if window.piwikTracker?
    piwikTracker.trackPageview()
