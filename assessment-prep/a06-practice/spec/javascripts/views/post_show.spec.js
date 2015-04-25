describe("PostApp.Views.PostShow", function () {
  beforeEach(function() {
    this.post = new PostApp.Models.Post({ title: "post1" });
    this.view = new PostApp.Views.PostShow({ model: this.post });
  })

  it("renders content into $el", function () {
    this.view.render();
    expect(this.view.$el.text()).toMatch(/post1/);
  });

  describe("initialize", function () {
    it("listens to 'sync' on the model", function () {
      this.post.set("title", "I love cats!");
      this.post.trigger('sync');
      expect(this.view.$el.text()).toMatch(/I love cats!/);
    });
  });
});
