Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {

  var $divDetail = $('<div>').addClass('detail');
  var pokemonAttributes = ["name", "attack", "defense", "poke_type", "moves"];
  var $ul = $('<ul>').addClass('toys');

  pokemonAttributes.forEach(function (attribute) {
    var $detail = $('<div>').text(attribute + ": " + pokemon.escape(attribute));
    $divDetail.append($detail);
  });

  pokemon.toys().each( function (toy) {
    $ul.append(this.addToyToList(toy));
  }.bind(this));

    // toyAttr.forEach( function (attribute) {
    // });


  var $img = $('<img>').attr("src", pokemon.escape('image_url'));

  $divDetail.prepend($img);
  $divDetail.append($ul);

  this.$pokeDetail.html($divDetail);


};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
  // use render pokemon detail on click, event will be on a dom target
  var pokeId = $(event.currentTarget).data('id');
  var pokemon = this.pokes.get(pokeId);

  pokemon.fetch({
    success: this.renderPokemonDetail.bind(this)
  });
};



// Pokedex.RootView.prototype.refreshPokemon = function () {
//   this.pokes.fetch({
//     success: function () {
//       this.pokes.each(this.addPokemonToList.bind(this));
//     }.bind(this)
//   });
// };
