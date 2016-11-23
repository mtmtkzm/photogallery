<my-photo>
  <section class="column is-half">
    <img onload={ getExif } class="photo" src="./images/img3.jpg">
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

  <script>
    var _self = this;
    var exifAll = {};

    var exif = {
      'camera': 'undefined',
      'ss': 'undefined',
      'f': 'undefined',
      'focal': 'undefined',
      'iso': 'undefined',
      'exposure': 'undefined',
      'flash': 'undefinede'
    };

    getExif(e) {
      e.preventUpdate = true;
      EXIF.getData(e.target, function() {
        exifAll = EXIF.getAllTags(this); // 全情報をブッコム（ここのthisは<img>）

        // 必要な情報だけを抽出
        exif.camera = exifAll.Model;
        exif.ss = exifAll.ShutterSpeedValue;
        exif.f = exifAll.FNumber;
        exif.focal = exifAll.FocalLengthIn35mmFilm;
        exif.iso = exifAll.ISOSpeedRatings;
        exif.exposure = exifAll.ExposureTime;
        exif.flash = exifAll.Flash;

      });
    }
    
  </script>
</my-photo>
