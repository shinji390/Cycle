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
  $('.fadein').css('opacity', 0.1);
  $('.fadein').on('inview', function(event, isInView, visiblePartX, visiblePartY) {
    if (isInView) {
      $(this).stop().animate({opacity: 1}, 300);
    } else {
      $(this).stop().animate({opacity: 0.1}, 300);
    }
  });
});

jQuery(document).on('change', 'input[type=file]', function () {
  let file = ($(this).prop('files')[0].name);
  $('#file_name').text('| ' + file);

});
