$.Tabs = function (el) {
  this.$tabsContent = $(el);
  this.$tabsNav = $(this.$tabsContent.data("tabs-nav"));
  this.$activeTab = this.$tabsContent.find(".active");
  this.populateTabs();
  this.$tabsNav.on("click", "li.nav-tab-header", this.clickTab.bind(this));
};


$.fn.tabs = function () {
  var $tabs = this.find(".tabs-container");
  $tabs.each(function () {
    new $.Tabs(this);
  });

  return this;
};

$.Tabs.prototype.populateTabs = function () {
  var that = this;
  this.$tabsContent.find(".tab").each(function (i, el) {
    var tabId = that.$tabsNav.attr('id') + '-' + i;
    var tabHeader = $(el).find('.tab-header').text();
    $(el).attr('id', tabId);
    var header = $('<li>')
                  .text(tabHeader)
                  .attr('data-tab-id', tabId)
                  .addClass('nav-tab-header');
    if ($(el).hasClass("active")) {
        header.addClass("active");
    }
    that.$tabsNav.append(header);
  });
};


$.Tabs.prototype.clickTab = function (event) {
  if (this.$tabsContent.find(".transitioning").length !== 0) {
    return;
  }
  var oldActive = this.$tabsContent.find(".active");
  oldActive.removeClass("active").addClass("transitioning");
  this.$tabsNav.find(".active").removeClass("active");
  $(event.currentTarget).addClass("active");
  var id = $(event.currentTarget).data("tab-id");
  var newActive = this.$tabsContent.find("#" + id);
  newActive.addClass("transitioning-in");
  window.setTimeout(function (event) {
    oldActive.removeClass("transitioning");
    newActive.removeClass("transitioning-in").addClass("active");
  }, 500);
};
