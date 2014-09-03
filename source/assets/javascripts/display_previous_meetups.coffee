window.displayPreviousMeetups = ->
  MEETUP_COUNT = 8
  meetup = new MeetupApi

  meetup.loadPastEvents().done ->
    events = meetup.pastEvents.slice(0, MEETUP_COUNT)
    $.each events, (_index, event) ->
      element = firstEventListing().clone()
      updateEventInformation(element, event)
      element.appendTo('.meetups')
      element.show()

updateEventInformation = (element, event) ->
  setDate(element, event.monthYear())
  setName(element, event.name())
  setUrl(element, event.eventUrl())
  setSpeaker(element, event.speakerName())

setDate = (element, date) ->
  setRoleText(element, 'date', date)

setName = (element, name) ->
  setRoleText(element, 'name', name)

setUrl = (element, url) ->
  element.find("[data-role='name']").prop('href', url)

setSpeaker = (element, speakerName) ->
  setRoleText(element, 'speaker-name', speakerName)

setRoleText = (element, role, text) ->
  element.find("[data-role='#{role}']").text(text)

firstEventListing = ->
  $($(".slide")[0])
