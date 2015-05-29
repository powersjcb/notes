$.Thumbnails = function (wrapper) {
  this.$wrapper = $(wrapper);
  this.$images =  this.$wrapper.find("img");
  this.bindImageListeners();
  this.$boundImage = this.$images.eq(0);
  this.activate(this.$boundImage);
};


$.fn.thumbnails= function () {
  return this.each(function () {
    new $.Thumbnails(this);
  });
};

$.Thumbnails.prototype.activate = function ($img) {
  var $clone = $img.clone();
  this.$wrapper.find(".active").empty().append($clone);
};

$.Thumbnails.prototype.bindImageListeners = function () {
  this.$wrapper.find(".gutter-images").on("mouseenter", "img", function (event) {
    this.activate($(event.currentTarget));
  }.bind(this));
  this.$wrapper.find(".gutter-images").on("click", "img", function (event) {
    this.activate($(event.currentTarget));
    this.$boundImage = $(event.currentTarget);
  }.bind(this));
  this.$wrapper.find(".gutter-images").on("mouseleave", "img", function (event) {
    this.activate(this.$boundImage);
  }.bind(this));
};
