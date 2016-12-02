/* *****
連番の画像（./images/oo.jpg）に対しHEADリクエスト。statusで画像数をカウント。 */

var current = 0; // 最終的な返り値
var imageArray = [];

function getImage(num) {
  var target = './images/img' + (num+1) + '.jpg';
  var xmlhttp = new XMLHttpRequest();

  xmlhttp.open('HEAD', target);
  xmlhttp.send();
  xmlhttp.addEventListener('readystatechange', function() {
    if (xmlhttp.readyState == 4) {
      if (xmlhttp.status == 200) {
        imageArray.unshift(target);
        current += 1;
        getImage(num+1);
      } else {
        number = current;
        riot.mount('my-photo');
      }
    }
  });
}

getImage(0);


/* *****
フィルタリング */

// // フォーム
// var form = document.forms.filteringForm;

// // フィルター実行ボタン
// var button = document.getElementById('js-filter-button');

// // フィルタリングの値が入る
// var filteredExif = {};

// button.addEventListener('click', function (event) {
//   filteredExif ={
//     'f': {
//       min: form.fMin.value,
//       max: form.fMax.value
//     },
//     'focal': {
//       min: form.focalMin.value,
//       max: form.focalMax.value
//     },
//     'iso': {
//       min: form.isoMin.value,
//       max: form.isoMax.value
//     },
//     'shutter': {
//       min: form.shutterMin.value,
//       max: form.shutterMax.value
//     },
//     'flash': true
//   };
//   console.log(filteredExif);
// });
