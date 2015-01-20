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
  setEventText("month", event.month())
  setEventText("day", event.day())
  setEventText("time", event.time())

setVenueName = (name) ->
  setEventText("venue-name", name)

setEventText = (role, text) ->
  eventOnPage(role).text(text)

eventOnPage = (role) ->
  $("[data-role='event'] [data-role='#{role}']")

showMeetup = ->
  $("[data-role='event']").show()
