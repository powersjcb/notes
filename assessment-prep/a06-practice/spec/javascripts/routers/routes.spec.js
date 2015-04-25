describe("PostApp.Routers.Router - routes", function() {
  beforeEach(function() {
    this.router = new PostApp.Routers.Router({
      $rootEl: $('<div>')
    });
  });

  it("fires the post show route (posts/1)", function() {
    expect(this.router.routes.hasOwnProperty("posts/:id")).toBeTruthy();
  });

  it("fires the new route (posts/new)", function() {
    expect(this.router.routes.hasOwnProperty("posts/new")).toBeTruthy();
  });

  it("fires the edit route (posts/1/edit)", function() {
    expect(this.router.routes.hasOwnProperty("posts/:id/edit")).toBeTruthy();
  });

  it("fires the index route ()", function() {
    expect(this.router.routes.hasOwnProperty("")).toBeTruthy();
  });
});
