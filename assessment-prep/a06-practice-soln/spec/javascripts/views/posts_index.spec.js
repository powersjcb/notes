describe("PostApp.Views.PostsIndex", function () {
  beforeEach(function () {
    this.collection = new PostApp.Collections.Posts([
      { title: "post1", id: 1 },
      { title: "post2", id: 2 },
      { title: "post3", id: 3 }]);
    this.view = new PostApp.Views.PostsIndex({ collection: this.collection });
  });

  describe("events hash", function () {
    it("fires 'destroyPost' on click of class '.delete'", function () {
      expect(this.view.events["click .delete"]).toMatch("destroyPost");
    });
  });

  describe("render", function () {
    it("returns a view", function () {
      expect(this.view.render().constructor).toEqual(PostApp.Views.PostsIndex);
    });

    it("changes the $el of the view", function () {
      this.view.render();
      expect(this.view.$el.text()).toMatch("Post Index View");
    });
  });

  describe("initialize", function () {
    it("listens to 'add change:title remove reset' on the collection", function () {
      this.collection.at(0).set("title", "I love cats!");
      expect(this.view.$el.text()).toMatch(/I love cats!/);
    });
  });
});
