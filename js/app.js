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
        return;
      } else {
        number = current;
        riot.mount('my-photo');

        return number;
      }
    }
  });
}

getImage(0);
