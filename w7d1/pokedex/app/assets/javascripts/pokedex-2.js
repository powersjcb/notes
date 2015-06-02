Pokedex.RootView.prototype.addToyToList = function (toy) {
  var toyAttr = ["name", "happiness", "price"];
  var $li = $('<li>').data("toy-id", toy.id).data("pokemon-id", toy.get("pokemon_id"));

  toyAttr.forEach(function(attribute) {
    var $div = $('<div>');
    $div.html(attribute + ": " + toy.escape(attribute));
    $li.append($div);
  })
  return $li;
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) {
  var $img = $('<img>').attr('src', toy.escape("image_url"));
  this.$toyDetail.html($img);
};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  var pokemonID = $(event.currentTarget).data("pokemon-id");
  var toyID = $(event.currentTarget).data("toy-id");
  var toy = this.pokes.get(pokemonID).toys().get(toyID);
  this.renderToyDetail(toy);
};
