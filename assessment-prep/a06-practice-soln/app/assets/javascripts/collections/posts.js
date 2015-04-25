PostApp.Collections.Posts = Backbone.Collection.extend({
  model: PostApp.Models.Post,
  url: '/api/posts',

  comparator: function(post) {
    return post.get('order');
  },

  getOrFetch: function (id) {
    var post = this.get(id),
      posts = this;
    if(!post) {
      post = new PostApp.Models.Post({ id: id });
      post.fetch({
        success: function () {
          posts.add(post);
        },
      });
    } else {
      post.fetch();
    }
    return post;
  }
});

PostApp.Collections.posts = new PostApp.Collections.Posts();
