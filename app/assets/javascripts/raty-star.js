$(document).on("turbolinks:load", () => {
  const pathname = location.href;
  const userShowRegExp = new RegExp(/.+\/users\/\d+$/);
  const usersShowRegExp = new RegExp(/.+\/users\/\d+$/);
  const usersIndexRegExp = new RegExp(/.+\/users\/$/);
  const trainerEvaluationsEditRegExp = new RegExp(/.+\/users\/\d+\/trainer_evaluations\/\d+\/\edit/);
  // MEMO:星評価を出したいパスを指定する：下とセットで使用する
  const trainerEvaluationsNewRegExp = new RegExp(/.+\/users\/\d+\/trainer_evaluations\/new\/*/);
  const starOnImagePath = image_path('star-on.png');
  const starOffImagePath = image_path('star-off.png');
  const starHalfImagePath = image_path('star-half.png');
  const checkUserPath = () => userShowRegExp.test(pathname);
  const checkUserShowIndexPath = () => usersShowRegExp.test(pathname) || usersIndexRegExp.test(pathname);
  const checkEvaluationPath = () => trainerEvaluationsEditRegExp.test(pathname) || trainerEvaluationsNewRegExp.test(pathname);
  // MEMO:星評価を出したいパスを指定する：const checkPath = () => userShowRegExp.test(pathname) || trainerEvaluationsNewRegExp.test(pathname);
  if (checkUserPath()) {
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
  } else if (checkEvaluationPath(pathname)) {
    $('#star_rank1').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[fun_rate]',
      half: true,
    });
    $('#star_rank2').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[understandable_rate]',
      half: true,
    });
    $('#star_rank3').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[politeness_rate]',
      half: true,
    });
    $('#star_rank4').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[kindness_rate]',
      half: true,
    });
    $('#star_rank5').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[passion_rate]',
      half: true,
    });
  } else if (checkUserShowIndexPath(pathname)) {
    $('#star_rank1').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[fun_rate]',
      half: true,
      readOnly: true,
    });
    $('#star_rank2').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[understandable_rate]',
      half: true,
      readOnly: true,
    });
    $('#star_rank3').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[politeness_rate]',
      half: true,
      readOnly: true,
    });
    $('#star_rank4').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[kindness_rate]',
      half: true,
      readOnly: true,
    });
    $('#star_rank5').raty({
      size     : 36,
      starOff:  starOffImagePath,
      starOn : starOnImagePath,
      starHalf: starHalfImagePath,
      scoreName: 'trainer_evaluation[passion_rate]',
      half: true,
      readOnly: true,
    });
  }

// const $ = function(string) {
//   if (string.indexOf('.') == 0) {
//     //class
//     return document.getElementsByClassName[0]; //=> raty add とかで見た目を変更できるインスタンスinstannsuメソッドがついてる この見た目クラスをDOM 
//   } else if (string.indexOf('#') == 0) {
//     return document.getElementById; //=> raty add とかで見た目を変更できるインスタンスinstannsuメソッドがついてる この見た目クラスをDOM 
//   }
})