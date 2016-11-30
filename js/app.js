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
        imageArray.push(target);
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
// フィルタリングelmのvalue
var filteredExif = {};

// フィルター実行ボタン
var button = document.getElementById('js-filter-button');
button.addEventListener('click', function (event) {
  filteredExif ={
    'f': {
      min: '100',
      max: '120'
    },
    'focal':  {
      min: '80',
      max: '100' 
    },
    'iso': {
      min: '400',
      max: '1600'
    },
    'shutter': {
      min: '1/160',
      max: '1/100'
    },
    'flash': 'true'
  };
  console.log(filteredExif);
});

