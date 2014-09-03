window.displayInformationForNextMeetup = ->
  meetup = new MeetupApi

  meetup.loadEvents().done ->
    nextEvent = meetup.firstEvent()

    setMapLocation(nextEvent.mapUrl())
    setName(nextEvent.name())
    setDescription(nextEvent.description())
    setDateTime(nextEvent)
    setVenueName(nextEvent.venueName())
    setRsvpUrl(nextEvent.eventUrl())

    showMeetup()

setMapLocation = (url) ->
  eventOnPage("map").prop("src", url).load()

setRsvpUrl = (url) ->
  eventOnPage("rsvp-link").prop("href", url)

setName = (name) ->
  setEventText("name", name)

setDescription = (text)->
  eventOnPage("description").html(text)

setDateTime = (event) ->
  setEventText("time", event.time())
  setEventText("date", event.date())

setVenueName = (name) ->
  setEventText("venue-name", name)

setEventText = (role, text) ->
  eventOnPage(role).text(text)

eventOnPage = (role) ->
  $("[data-role='event'] [data-role='#{role}']")

showMeetup = ->
  $(".event").show()
