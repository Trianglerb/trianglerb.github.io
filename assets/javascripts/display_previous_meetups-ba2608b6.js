(function(){var n,e,t,r,a,u;window.displayPreviousMeetups=function(){var e,t;return e=8,t=new MeetupApi,t.loadPastEvents().done(function(){var r;return r=t.pastEvents.slice(0,e),$.each(r,function(e,t){var r;return r=n().clone(),u(r,t),r.appendTo("[data-role='past-meetups']"),r.show()})})},u=function(n,r){return e(n,r.monthYear()),t(n,r.name()),a(n,r.eventUrl())},e=function(n,e){return r(n,"date",e)},t=function(n,e){return r(n,"name",e)},a=function(n,e){return n.find("[data-role='name']").prop("href",e)},r=function(n,e,t){return n.find("[data-role='"+e+"']").text(t)},n=function(){return $($("[data-role='past-meetup']")[0])}}).call(this);