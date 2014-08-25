# Piwik Turobo Links helper
# FIXME: Is this working?
# http://reed.github.io/turbolinks-compatibility/piwik.html
$(document).on 'page:change', ->
  if window._paq?
    _paq.push ['trackPageview']
  else if window.piwikTracker?
    piwikTracker.trackPageview()
