<my-photo>
  <!-- Layout -->
  <section each={ task, i in images } class="column is-half">
    <img onload={ getExif } class="photo" src="./images/img{ i+1 }.jpg">
    <div class="exif columns is-multiline">
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].camera }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif[i].ss }</span></p>
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
      // 配列の当該番目に空Objectを挿入
      _self.exif[e.item.i] = {};
      console.log(_self.exif[e.item.i]);
      _self.exif[e.item.i].camera = exifAll.Model;
      _self.exif[e.item.i].ss = exifAll.ShutterSpeedValue;
      _self.exif[e.item.i].f = exifAll.FNumber;
      _self.exif[e.item.i].focal = exifAll.FocalLengthIn35mmFilm;
      _self.exif[e.item.i].iso = exifAll.ISOSpeedRatings;
      _self.exif[e.item.i].exposure = exifAll.ExposureTime;
      _self.exif[e.item.i].flash = exifAll.Flash;

      // 抽出後の情報でテンプレート変数をupdate
      _self.update(_self.exif[e.item.i]);
    });
  }

  </script>
</my-photo>
