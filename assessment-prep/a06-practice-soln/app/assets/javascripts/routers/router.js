PostApp.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index",
    "posts/new": "new",
    "posts/:id": "show",
    "posts/:id/edit": "edit"
  },

  edit: function (id) {
    var post = PostApp.Collections.posts.getOrFetch(id);

    var formView = new PostApp.Views.PostForm({
      model: post,
      collection: PostApp.Collections.posts
    });

    this._swapView(formView);
  },

  index: function () {
    PostApp.Collections.posts.fetch();

    var indexView = new PostApp.Views.PostsIndex({
      collection: PostApp.Collections.posts
    });

    this._swapView(indexView);
  },

  new: function () {
    var newPost = new PostApp.Models.Post();

    var formView = new PostApp.Views.PostForm({
      collection: PostApp.Collections.posts,
      model: newPost
    });

    this._swapView(formView);
  },

  show: function (id) {
    var post = PostApp.Collections.posts.getOrFetch(id);
    var formView = new PostApp.Views.PostShow({ model: post });
    this._swapView(formView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
