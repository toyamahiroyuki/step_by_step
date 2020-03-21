// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require_tree .

// $('#calendar').fullCalendar({ });

function eventCalendar() {
  return $('#calendar').fullCalendar({
      dayClick: function(date, jsEvent, view, resourceObj) {

    window.location.href = '/incomes/new?day=' + date.format()// 通常の遷移
    $(function(){
      $('.fc-day').mouseover(function(){
        $('.fc-day').css({'background-color': 'red'});
    });
});
  }
});

};
function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};
$(document).on('turbolinks:load', function(){
  eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);


/*
function _eventCalendar() {

	var cal_elem = document.getElementById('calendar');
	var calendar = new Calendar(cal_elem, {

  eventClick: function(info) {
    alert('Event: ' + info.event.title);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('View: ' + info.view.type);

    // change the border color just for fun
    info.el.style.borderColor = 'red';
  }

});
}
*/

