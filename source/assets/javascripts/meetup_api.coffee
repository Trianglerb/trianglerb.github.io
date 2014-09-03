class window.MeetupApi
  EVENTS_URL: "http://api.meetup.com/2/events?group_id=134061&status=upcoming&order=time&limited_events=False&desc=false&offset=0&format=json&page=200&fields=&sig_id=41740092&sig=74ab1ae1cc8d11c390439495100fbf0f540ae77a"
  PAST_EVENTS_URL: 'http://api.meetup.com/2/events?status=past&order=time&limited_events=False&group_urlname=raleighrb&desc=true&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=41740092&sig=bf96359b8ae2d7b1fe447908027c5ff006db7afd'

  events: []
  pastEvents: []

  firstEvent: -> new MeetupEvent(@events[0])

  loadEvents: ->
    $.ajax
      type: "GET"
      url: @EVENTS_URL
      contentType: "application/json",
      dataType: "jsonp",
      success: (data) =>
        @events = data.results

  loadPastEvents: ->
    $.ajax
      type: "GET"
      url: @PAST_EVENTS_URL
      contentType: "application/json",
      dataType: "jsonp",
      success: (data) =>
        @pastEvents = $.map data.results, (item) ->
          new MeetupEvent(item)
