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

// audioファイル
jQuery(document).on('change', '#post_melody, #comment_melody', function () {
  let file = ($(this).prop('files')[0].name);
  $('#audio_file_name').text(' | ' + file);
});

// videoファイル
jQuery(document).on('change', '#post_video, #commment_video', function () {
  let file = ($(this).prop('files')[0].name);
  $('#video_file_name').text(' | ' + file);
});


// imageファイル
jQuery(document).on('change', '#user_avatar', function () {
  let file = ($(this).prop('files')[0].name);
  $('#avatar_file_name').text(' | ' + file);
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

$(function() {
$('[placeholder]').ahPlaceholder({
    placeholderColor : 'silver',
    placeholderAttr : 'placeholder',
    likeApple : false
    });
});
