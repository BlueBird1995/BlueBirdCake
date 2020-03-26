// トップページのスライドショーのコード
$(function () {
  // 関数を宣言
  var $setElm = $('.viewer'),
    // .viewerと名前のついたクラスを取得する
    fadeSpeed = 1500,
    switchDelay = 4000;
  // .viewerに切り替えスピードと掲載時間を設定する（ミリ秒＝１.５欠けて切り替え、４秒表示）

  $setElm.each(function () {
    // .viewerの子要素にそれぞれ関数を宣言する
    var targetObj = $(this);
    var findUl = targetObj.find('ul');
    var findLi = targetObj.find('li');
    var findLiFirst = targetObj.find('li:first');
    // ここらへんは正直よくわかっていません
    findLi.css({
      display: 'block',
      opacity: '0',
      zIndex: '99'
    });
    findLiFirst.css({
      zIndex: '100'
    }).stop().animate({
      opacity: '1'
    }, fadeSpeed);

    setInterval(function () {
      findUl.find('li:first-child').animate({
        opacity: '0'
      }, fadeSpeed).next('li').css({
        zIndex: '100'
      }).animate({
        opacity: '1'
      }, fadeSpeed).end().appendTo(findUl).css({
        zIndex: '99'
      });
    }, switchDelay);
  });
});


// トップページにいくとタイトルロゴを表示するjavascript
$(function () {
  setTimeout(function () {
    // 時間を設定して関数を宣言
    $('.start p').fadeIn(1600);
  }, 500);
  //0.5秒後にロゴをフェードイン!
  setTimeout(function () {
    $('.start').fadeOut(500);
  }, 2500);
  //2.5秒後にロゴ含め背景をフェードアウト！
});

// CSSで以下のように定義している
// .start {
//   background: tan;
//   position: fixed;
//   top: 0;
//   left: 0;
//   height: 100 % ;
//   width: 100 % ;
//   z - index: 9000;
// }
// これを消すことで、画面がひらけた感じになる
