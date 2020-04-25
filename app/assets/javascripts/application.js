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
      dayClick: function(date, jsEvent, view, resourceObj, start) {
        // window.location.href = '/incomes/new?day=' + date.format();　//日付をqueryパラメーターで送信
        var day = date.format('YYYY/MM/DD');  //クリックした日付情報を取得        console.log(day)
        $.ajax({          //newアクション発火
          type: 'GET',
          url: '/incomes/new',
        }).done(function (res) {
          $('.modal-body').html(res);          //収入登録用のhtmlを作成
          $('.income-day').html(day);          //フォームの日付をクリックした日付とする
          $('.hidden-income-day').val(day);　　//フォームのhiddenのvalueを作成
          $('.modal').modal();       　　　　   // フォームのモーダル表示
          // 成功処理
        }).fail(function (result) {
          // 失敗処理
          alert('エラーが発生しました。運営に問い合わせてください。')
        });
      },
      titleFormat: 'YYYY年 M月',
      dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
      events: total,
      header: {
                    left: 'title',
                    center: '',
                    right: 'today prev,next',
                },
      eventColor: '#1e90ff'
    });

　　//収支が+,-,0の時で色が変わる
    $(".fc-event:contains('-')").css("background-color",'#ff0000');
    $(".fc-event:contains('-')").css("border-color",'#ff0000');
    //0の時、半角スペースになるので、半角スペースを感知し、0を挿入後、色変化
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




//ナビの途中からスクロール
$(function () {
  $(window).scroll(function () {

      if ($(this).scrollTop() > 160) {  //topから155px以上でバーがスクロール
          $('.navbar').addClass('is-fixed');
          $('.home-title-calendar').addClass('is-fixed-home');
      } else {
          $('.navbar').removeClass('is-fixed');
          $('.home-title-calendar').removeClass('is-fixed-home');
      }
  });
});
