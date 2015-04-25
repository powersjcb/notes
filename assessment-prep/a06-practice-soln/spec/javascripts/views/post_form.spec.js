describe("PostApp.Views.PostForm", function () {
  beforeEach(function () {
    var post = new PostApp.Models.Post({ title: "post1" });
    this.view = new PostApp.Views.PostForm({ model: post });
  });

  describe("events hash", function () {
    it("will call submit when any button element is clicked", function () {
      expect(this.view.events["click button"]).toMatch(/submit/);
    });
  });

  describe("render", function () {
    it("changes content in $el", function () {
      this.view.render();
      expect(this.view.$el.text()).toMatch(/Submit/);
    });
  });

  it("the $el container of PostApp.Views.PostForm is <form>", function () {
    expect(this.view.el.nodeName).toEqual("FORM");
  });
});
