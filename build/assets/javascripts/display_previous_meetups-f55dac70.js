(function(){var n,e,t,r,u,o;window.displayPreviousMeetups=function(){var e,t;return e=8,t=new MeetupApi,t.loadPastEvents().done(function(){var r;return r=t.pastEvents.slice(0,e),$.each(r,function(e,t){var r;return r=n().clone(),o(r,t),r.appendTo(".meetups"),r.show()})})},o=function(n,r){return e(n,r.monthYear()),t(n,r.name()),u(n,r.eventUrl())},e=function(n,e){return r(n,"date",e)},t=function(n,e){return r(n,"name",e)},u=function(n,e){return n.find("[data-role='name']").prop("href",e)},r=function(n,e,t){return n.find("[data-role='"+e+"']").text(t)},n=function(){return $($(".slide")[0])}}).call(this);