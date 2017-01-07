<my-photo class="columns is-multiline">
  <!-- Layout -->
  <section class="column is-half photo" each={ task, i in images }>
    <figure class="image is-3by2">
      <img onload={ setExif } src="{this.images[i].path}">
    </figure>
    <div class="exif columns is-multiline is-mobile">
      <p class="column is-12">
        <span class="icon-camera"></span>{ this.images[i].exif.camera }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-f"></span>{ this.images[i].exif.f }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-focal"></span>{ this.images[i].exif.focal }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-iso"></span>{ this.images[i].exif.iso }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-shutter"></span>{ this.images[i].exif.shutter }
      </p>
      <p class="column is-half-mobile is-half-tablet is-one-third-desktop">
        <span class="icon-flash"></span>{ this.images[i].exif.flash }
      </p>
    </div>
  </section>

  <!-- Logic -->
  <script>
  var _self = this;
  this.images = allImages;

  var exifAll = {};
  var exif = [];

  setExif = function(e) {
    e.preventUpdate = true;
    EXIF.getData(e.target, function() {
      exifAll = EXIF.getAllTags(this);
      var i = e.item.i;

      // 必要な情報を抽出し代入
      allImages[i].exif.camera = getModel(exifAll);
      allImages[i].exif.f = getF(exifAll);
      allImages[i].exif.focal = getFocal(exifAll);
      allImages[i].exif.iso = getIso(exifAll);
      allImages[i].exif.shutter = getShutter(exifAll);
      allImages[i].exif.flash = getFlash(exifAll);

      return allImages[i];
    });
    console.log(allImages);
    _self.update(allImages);
  }

  var getModel = function(arr) {
    var model = arr.Model;
    return model;
  }
  var getF = function(arr) {
    var FNumber = 'f/ ' + arr.FNumber;
    return FNumber;
  }
  var getFocal = function(arr) {
    var Focal = arr.FocalLength + ' mm';
    return Focal;
  }
  var getIso = function(arr) {
    var ISO = arr.ISOSpeedRatings;
    return ISO;

  }
  var getShutter = function(arr) {
    var denominator = arr.ExposureTime.denominator; // 分母
    var numerator = arr.ExposureTime.numerator; // 分子
    if(denominator === 1)  {
      return numerator + ' s';
    } else {
      return String(numerator) + '/' + String(denominator) + ' s';  
    }    
  }
  var getFlash = function(arr) {
    if(exifAll.Flash === 'Flash did not fire, compulsory flash mode') {
      return 'not Fire.';
    } else if (exifAll.Flash === 'Flash fired, compulsory flash mode') {
      return 'Fired.';
    } else {
      return '--';
    }
  }

  </script>
</my-photo>
