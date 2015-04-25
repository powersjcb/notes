describe("PostApp.Routers.Router - handlers", function() {
  beforeEach(function () {
    PostApp.posts = new PostApp.Collections.Posts();
    PostApp.posts.add(new PostApp.Models.Post({ id: 1 }));

    this.$rootEl = $('<div>');
    this.router = new PostApp.Routers.Router({
      $rootEl: this.$rootEl,
      posts: PostApp.posts
    });
  });

  describe("#index handler", function() {
    it("renders the Post Index template into $rootEl", function () {
      this.router.index();
      expect(this.$rootEl.text()).toMatch(/Post Index View/);
    });
  });

  describe("#show handler", function () {
    it("renders the Post Show template into $rootEl", function () {
      this.router.show("1");
      expect(this.$rootEl.text()).toMatch(/Post Show View/);
    });
  });

  describe("#new handler", function () {
    it("renders the Post Form template into $rootEl", function () {
      this.router.new();
      expect(this.router.$rootEl.text()).toMatch(/Submit/);
    });
  });

  describe("#edit handler", function () {
    it("renders the Post Form template into $rootEl", function () {
      this.router.edit("1");
      expect(this.router.$rootEl.text()).toMatch(/Submit/);
    });
  });
});
