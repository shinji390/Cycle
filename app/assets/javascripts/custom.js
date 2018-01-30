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
