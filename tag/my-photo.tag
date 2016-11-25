<my-photo>
  <!-- Layout -->
  <section each={ task, i in images } class="column is-half">
    <img onload={ getExif } class="photo" src="./images/img{ i+1 }.jpg">
    <div class="exif columns is-multiline">
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].camera }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].f }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].focal }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].iso }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].exposure }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].flash }</span></p>
    </div>
  </section>

  <!-- Logic -->
  <script>
  this.images = imageArray;
  var _self = this;
  var exifAll = {};
  this.exif = [];

  getExif(e) {
    e.preventUpdate = true;
    EXIF.getData(e.target, function() {
      exifAll = EXIF.getAllTags(this);
      var i = e.item.i;

      // 配列の当該番目に空Objectを挿入
      _self.exif[i] = {};

      // 必要な情報を抽出し代入
      // カメラの機種
      _self.exif[i].camera = exifAll.Model;
      // F値
      _self.exif[i].f = 'f/ ' + exifAll.FNumber;
      // 焦点距離
      _self.exif[i].focal = exifAll.FocalLength + ' mm';
      // ISO
      _self.exif[i].iso = 'ISO ' + exifAll.ISOSpeedRatings;
      // 露出（シャッタースピード）
      _self.exif[i].exposure =
        function() { 
          var denominator = exifAll.ExposureTime.denominator;
          var numerator = exifAll.ExposureTime.numerator;
          if(denominator == 1) return numerator + ' s';
          return String(numerator) + '/' + String(denominator) + ' s';
        }();
      // フラッシュ
      _self.exif[i].flash =
        function() { 
          if(exifAll.Flash == 'Flash did not fire, compulsory flash mode') return 'not Fire.';
          else if(exifAll.Flash == 'Flash fired, compulsory flash mode')   return 'Fired.';
        }();


      console.log(exifAll);
      // 抽出後の情報でテンプレート変数をupdate
      _self.update(_self.exif[i]);
    });
  }

  </script>
</my-photo>
