window.displayPreviousMeetups = ->
  MEETUP_COUNT = 8
  meetup = new MeetupApi

  meetup.loadPastEvents().done ->
    events = meetup.pastEvents.slice(0, MEETUP_COUNT)
    $.each events, (_index, event) ->
      element = firstEventListing().clone()
      updateEventInformation(element, event)
      element.appendTo("[data-role='past-meetups']")
      element.show()

updateEventInformation = (element, event) ->
  setDate(element, event.monthYear())
  setName(element, event.name())
  setUrl(element, event.eventUrl())

setDate = (element, date) ->
  setRoleText(element, 'date', date)

setName = (element, name) ->
  setRoleText(element, 'name', name)

setUrl = (element, url) ->
  element.find("[data-role='name']").prop('href', url)

setRoleText = (element, role, text) ->
  element.find("[data-role='#{role}']").text(text)

firstEventListing = ->
  $($("[data-role='past-meetup']")[0])
