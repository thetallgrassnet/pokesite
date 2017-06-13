twttr_events_bound = false

$ ->
  loadTwitterSDK ->
    bindTwitterEventHandlers() unless twttr_events_bound

bindTwitterEventHandlers = ->
  $(document).on 'turbolinks:load', renderTweetWidgets
  twttr_events_bound = true

renderTweetWidgets = ->
  twttr.widgets.load()

loadTwitterSDK = (callback) ->
  $.getScript("//platform.twitter.com/widgets.js", callback)
