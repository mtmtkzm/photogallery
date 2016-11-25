<my-photo class="columns is-multiline">
  <!-- Layout -->
  <section class="column is-half photo" each={ task, i in images }>
    <figure class="image is-3by2">
      <img onload={ getExif } src="./images/img{ i+1 }.jpg">
    </figure>
    <div class="exif columns is-multiline is-mobile">
      <p class="column is-12">
        <span class="icon-camera"></span>{ this.exif[i].camera }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-f"></span>{ this.exif[i].f }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-focal"></span>{ this.exif[i].focal }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-iso"></span>{ this.exif[i].iso }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-shutter"></span>{ this.exif[i].exposure }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-flash"></span>{ this.exif[i].flash }
      </p>
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
      _self.exif[i].iso = exifAll.ISOSpeedRatings;
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

      // 抽出後の情報でテンプレート変数をupdate
      _self.update(_self.exif[i]);
    });
  }

  </script>
</my-photo>
