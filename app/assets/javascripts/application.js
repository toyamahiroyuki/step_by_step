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
//= require jquery
//= require bootstrap-sprockets
//= require turbolinks
//= require moment
//= require fullcalendar
//= require_tree .

// $('#calendar').fullCalendar({ });


function eventCalendar() {

  $.ajax({
    type: 'GET',
    url: 'calendar_total',
  }).done(function(totals){
    var total = [];
    for (var total_key in totals) {
      total.push({
        title: totals[total_key],
        start: total_key,
      })
    }
    $('#calendar').fullCalendar({
      dayClick: function(date, jsEvent, view, resourceObj) {
        window.location.href = '/incomes/new?day=' + date.format()// 通常の遷移
      },
      titleFormat: 'YYYY年 M月',
      dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
      events: total,
      header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next',
                },
     eventColor: '#1e90ff'
    });

    $(".fc-event:contains('-')").css("background-color",'#ff0000');
    $(".fc-event:contains('-')").css("border-color",'#ff0000');
    $(".fc-event:contains('\u00A0')").css("background-color",'#dcdcdc');
    $(".fc-event:contains('\u00A0')").css("border-color",'#dcdcdc');
    $(".fc-event:contains('\u00A0')").html("<div>0</div>").css("color",'white');
  });
}

function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};
$(document).on('turbolinks:load', function(){
  eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);



  //   type: 'GET',
  //   url: 'calendar_incomes',
  // }).done(function(incomes){
  //   var income_key = [];
  //   for (var income in incomes) {
  //     income_key.push({
  //       title: incomes[income],
  //       start: income,
  //     })
  //   }
  //   console.log (income_key)
  //   return $('#calendar').fullCalendar({
  //     dayClick: function(date, jsEvent, view, resourceObj) {
  //       window.location.href = '/incomes/new?day=' + date.format()// 通常の遷移
  //     },
  //     events: income_key,
  //   });
  // });

  // $.ajax({
  //   type: 'GET',
  //   url: 'calendar_proportial_costs',
  // }).done(function(proportial_costs){
  //   var proportial_cost = [];

  //   for (var proportial_cost_key in proportial_costs) {
  //    proportial_cost.push({
  //       title: proportial_costs[proportial_cost_key],
  //       start: proportial_cost_key,
  //     })
  //   }
  //   console.log(proportial_cost)

  //   return $('#calendar').fullCalendar({
  //     dayClick: function(date, jsEvent, view, resourceObj) {
  //       window.location.href = '/incomes/new?day=' + date.format()// 通常の遷移
  //     },
  //     events: proportial_cost,
  //   });
  // });

 /*
  * 1. getEventsのリクエスト送信
  * 2. getEventsのレスポンス返却
    3. fullCalendarの画面描画
  */
  /*
  * 1. getEventsのリクエスト送信 -> 1.2. getEventsのレスポンス返却
  * 2. fullCalendarの画面描画
  */
  // var events = getEvents();
  // return $('#calendar').fullCalendar({
  //   dayClick: function(date, jsEvent, view, resourceObj) {
  //     window.location.href = '/incomes/new?day=' + date.format()// 通常の遷移
  //   },
  //   events: events,
  // });

  // return $('#calendar').fullCalendar({
  //   dayClick: function(date, jsEvent, view, resourceObj) {
  //     window.location.href = '/incomes/new?day=' + date.format()// 通常の遷移
  //   },
  //   viewRender :function(){
  //     $.ajax({
  //       type: 'GET',
  //       url: 'calendar_incomes',
  //     }).done(function(res){
  //       console.log(res)
  //       var dste = {"id":"1", "title":"aaaaaa", "start":"2020-03-21", "end":"2020-03-21", "url":"some_address", "description":"説明"}
  //       events: dste
  //     });
  //   }
  //     // .fail(function() {
  //     // // // 通信失敗時の処理を記述
  //     //    });



  // });