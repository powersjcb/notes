Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {

  var $li = $('<li>')
    .addClass('poke-list-item')
    .html(pokemon.escape('name') + " " + pokemon.escape('poke_type'))
    .data('id', pokemon.id);

  this.$pokeList.append($li);
};

Pokedex.RootView.prototype.refreshPokemon = function () {
  this.pokes.fetch({
    success: function () {
      this.pokes.each(this.addPokemonToList.bind(this));
    }.bind(this)
  });
};
