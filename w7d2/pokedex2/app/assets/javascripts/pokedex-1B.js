Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  // var $detail = $('<div class="detail">');
  // Show the image
  // $detail.append('<img src="' + pokemon.escape('image_url') + '"><br>');
  // Show the attributes
  // for (var attr in pokemon.attributes) {
  //   if (pokemon.get(attr) && attr !== 'id' && attr !== 'image_url') {
  //     $detail.append(
  //       '<span style="font-weight:bold;">' + attr + ':</span> ' +
  //         pokemon.get(attr) + '<br>'
  //     );
  //   }
  // }
  // this.$pokeDetail.html($detail);

  // Phase 2C.
  // this.$pokeDetail.append(
  //   '<span style="font-weight: bold;">Toys:</span><br>'
  // );
  // var $toys = $('<ul class="toys"></ul>');
  // this.$pokeDetail.append($toys);


  pokemon.fetch({
    success: (function() {
      var content = JST['pokemonDetail']({pokemon: pokemon});
      this.$pokeDetail.html(content);
      this.renderToysList(pokemon.toys());
    }).bind(this)
  });
};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
  // Phase II
  this.$toyDetail.empty();

  // Phase IB
  var $target = $(event.currentTarget);

  var pokeId = $target.data('id');
  var pokemon = this.pokes.get(pokeId);

  this.renderPokemonDetail(pokemon);
};
