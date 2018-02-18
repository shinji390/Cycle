$(function() {
$('[placeholder]').ahPlaceholder({
    placeholderColor : 'silver',
    placeholderAttr : 'placeholder',
    likeApple : false
    });
});

// falshフェイドアウト
setTimeout(function(){
  $('#set_time').fadeOut();
}, 3000);

// ツールチップ
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

// inview
$(function() {
  $('.fadein').on('inview', function(event, isInView, visiblePartX, visiblePartY) {
    if (isInView) {
      $(this).stop().addClass('scrollin');
    } else {
      $(this).stop().removeClass('scrollin');
    }
  });
});
