<my-photo>
  <!-- Layout -->
  <section each={ task, i in images } class="column is-half">
    <img onload={ getExif } class="photo" src="./images/img{ i+1 }.jpg">
    <div class="exif columns is-multiline">
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.camera }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.ss }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.f }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.focal }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.iso }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.exposure }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.flash }</span></p>
    </div>
  </section>

  <!-- Logic -->
  <script>

  this.images = imageArray;

  var _self = this;
  var exifAll = {};

  this.exif = {
    'camera': '--',
    'ss': '--',
    'f': '--',
    'focal': '--',
    'iso': '--',
    'exposure': '--',
    'flash': '--'
  };

  getExif(e) {
    e.preventUpdate = true;
    EXIF.getData(e.target, function() {
      exifAll = EXIF.getAllTags(this);

      // 必要な情報だけを抽出
      _self.exif.camera = exifAll.Model;
      _self.exif.ss = exifAll.ShutterSpeedValue;
      _self.exif.f = exifAll.FNumber;
      _self.exif.focal = exifAll.FocalLengthIn35mmFilm;
      _self.exif.iso = exifAll.ISOSpeedRatings;
      _self.exif.exposure = exifAll.ExposureTime;
      _self.exif.flash = exifAll.Flash;
      // 抽出後の情報でテンプレート変数をupdate
      _self.update(_self.exif);
    });
  }

  </script>
</my-photo>
