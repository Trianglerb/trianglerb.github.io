class window.MeetupApi
  EVENTS_URL: "http://api.meetup.com/2/events?group_id=134061&status=upcoming&order=time&limited_events=False&desc=false&offset=0&format=json&page=200&fields=&sig_id=41740092&sig=74ab1ae1cc8d11c390439495100fbf0f540ae77a"

  events: []

  firstEvent: -> new MeetupEvent(@events[0])

  loadEvents: ->
    $.ajax
      type: "GET"
      url: @EVENTS_URL
      contentType: "application/json",
      dataType: "jsonp",
      success: (data) =>
        @events = data.results
