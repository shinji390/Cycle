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

// トップボタン
$(function() {
    var topBtn = $('#to_top');
    topBtn.hide();
    //スクロールが200に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    //スクロールしてトップ
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});
