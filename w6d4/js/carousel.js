$.Carousel = function (htmlElement) {
  this.$carousel = $(htmlElement);
  this.activeIdx = 0;
  this.$items = this.$carousel.find('.items').children();
  this.makeActive(this.activeIdx);

  this.bindButtons();
}

$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};


$.Carousel.prototype.makeActive = function (id) {
  this.$items.eq(this.activeIdx).removeClass('active');
  this.activeIdx = id;
  this.$items.eq(id).addClass('active').removeClass('right left');
};

$.Carousel.prototype.bindButtons = function () {
  this.$carousel.find('.slide-right')
    .on('click', function () {
      var newIndex = (this.activeIdx - 1) % this.$items.length;
      this.$items.removeClass('right');
      this.$items.eq(newIndex).addClass('left');
      this.$items.eq(this.activeIdx).addClass('right');
      setTimeout( function () {
        this.makeActive(newIndex);
      }.bind(this), 0);
    }.bind(this));

  this.$carousel.find('.slide-left')
    .on('click', function () {
      var newIndex = (this.activeIdx + 1) % this.$items.length;
      this.$items.removeClass('left');
      this.$items.eq(newIndex).addClass('right')
      this.$items.eq(this.activeIdx).addClass('left');
      setTimeout( function () {
        this.makeActive(newIndex);
      }.bind(this), 0);
    }.bind(this));

};
