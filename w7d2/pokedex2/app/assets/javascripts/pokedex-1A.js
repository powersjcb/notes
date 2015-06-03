Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
  // var $li = $('<li class="poke-list-item">');
  // $li.data('id', pokemon.get('id'));
  //
  // var shortInfo = ['name', 'poke_type'];
  // shortInfo.forEach(function (attr) {
  //   $li.append(attr + ': ' + pokemon.get(attr) + '<br>');
  // });
  //var $li = $('<li class="poke-list-item">');
  var content = JST['pokemonListItem']({ pokemon: pokemon});
  this.$pokeList.append(content);
};

Pokedex.RootView.prototype.refreshPokemon = function () {
  this.pokes.fetch({
    success: (function () {
      this.$pokeList.empty();
      this.pokes.each(this.addPokemonToList.bind(this));
    }).bind(this)
  });

  return this.pokes;
};
