<my-photo>
  <section class="column is-half">
    <img onload={ getExif } class="photo" src="./images/img1.jpg">
    <div class="exif columns is-multiline">
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">{ this.exif.make }</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">シャッター</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">絞り</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">焦点距離</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">ISO感度</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">露出補正</span></p>
      <p class="column is-one-third"><span class="icon-camera"></span><span class="value">フラッシュ</span></p>
    </div>
  </section>

  <script>
    getExif(e) {
      e.preventUpdate = true;
      var target = e.target;

      EXIF.getData(target, function() {
        var exif = EXIF.getAllTags(this);
      });
    }
  </script>
</my-photo>
