/* *****
連番の画像（./images/oo.jpg）に対しHEADリクエスト。statusで画像数をカウント。 */

var current = 0; // 最終的な返り値
var allImages = []; // 写真一覧

function getImage(num) {
  var imgPath = './images/img' + (num+1) + '.jpg';
  var xmlhttp = new XMLHttpRequest();

  xmlhttp.open('HEAD', imgPath);
  xmlhttp.send();
  xmlhttp.addEventListener('readystatechange', function() {
    if (xmlhttp.readyState == 4) {
      if (xmlhttp.status == 200) {
        var imgObj = {}; // imgのpathとexifのobj
        imgObj = {
          "path": imgPath,
          "exif": {
            "camera": "--",
            "f": "--",
            "focal": "--",
            "iso": "--",
            "shutter": "--",
            "flash": "--"
          }
        }
        allImages.unshift(imgObj);
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

