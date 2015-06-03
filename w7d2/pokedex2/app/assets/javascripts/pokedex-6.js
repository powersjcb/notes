Pokedex.Router = Backbone.Router.extend({
  routes: {
    ""           : "pokemonIndex",
    "/pokemon/new": "pokemonForm",
    "/pokemon/:id": "pokemonDetail",
    "/toy/:id"    : "toyDetail"
  },

  pokemonDetail: function (id, callback) {
    if (typeof this._pokemonIndex === "undefined") {
      this._pokemonIndex = new Pokedex.Views.PokemonIndex();
      this._pokemonIndex.refreshPokemon();
    }
    var pokemon = this._pokemonIndex.pokes.get(id);

    this.pokemonDetail = new Pokedex.Views.PokemonDetail({model: pokemon});

    // this.pokemonDetail.refreshPokemon();
  },

  pokemonIndex: function (callback) {
    this._pokemonIndex = new Pokedex.Views.PokemonIndex();
    this._pokemonIndex.refreshPokemon();
    $("#pokedex .pokemon-list").html(this._pokemonIndex.$el);

  },

  toyDetail: function (pokemonId, toyId) {
  },

  pokemonForm: function () {
  }
});


$(function () {
  new Pokedex.Router();
  Backbone.history.start();
});
