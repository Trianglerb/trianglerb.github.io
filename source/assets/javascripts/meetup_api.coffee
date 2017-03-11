class window.MeetupApi
  EVENTS_URL: "http://api.meetup.com/2/events?group_id=134061&status=upcoming&order=time&limited_events=False&desc=false&offset=0&format=json&page=200&fields=&sig_id=41740092&key=12114e6a40a42583e5262e491d5631&sign=true"
  PAST_EVENTS_URL: 'http://api.meetup.com/2/events?status=past&order=time&limited_events=False&group_urlname=raleighrb&desc=true&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=41740092&sig_id=41740092&key=12114e6a40a42583e5262e491d5631&sign=true'

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
