$(document).on("turbolinks:load", () => {
  const pathname = location.href;
  const userShowRegExp = new RegExp(/.+\/users\/\d+/);
  const trainerEvaluationsNewRegExp = new RegExp(/.+\/trainer_evaluations\/new/);
  // #FIXME:パスが違う？
  const starOnImagePath = image_path('star-on.png');
  const starOffImagePath = image_path('star-off.png');
  const starHalfImagePath = image_path('star-half.png');

  const checkPath = () => userShowRegExp.test(pathname) || trainerEvaluationsNewRegExp.test(pathname);

  if (checkPath()) {
    $('#star_rank1').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'user[fun_rate]',
      half: true,
    });
    $('#star_rank2').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'user[understandable_rate]',
      half: true,
    });
    $('#star_rank3').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'user[politeness_rate]',
      half: true,
    });
    $('#star_rank4').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'user[kindness_rate]',
      half: true,
    });
    $('#star_rank5').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'user[passion_rate]',
      half: true,
    });
  }
});

// const $ = function(string) {
//   if (string.indexOf('.') == 0) {
//     //class
//     return document.getElementsByClassName[0]; //=> raty add とかで見た目を変更できるインスタンスinstannsuメソッドがついてる この見た目クラスをDOM 
//   } else if (string.indexOf('#') == 0) {
//     return document.getElementById; //=> raty add とかで見た目を変更できるインスタンスinstannsuメソッドがついてる この見た目クラスをDOM 
//   }
// }