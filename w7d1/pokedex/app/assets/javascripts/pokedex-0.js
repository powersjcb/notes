window.Pokedex = (window.Pokedex || {});
window.Pokedex.Models = {};
window.Pokedex.Collections = {};

Pokedex.Models.Pokemon = Backbone.Model.extend({
  urlRoot: "/pokemon",

  toys: function() {
    this._toys = this._toys || new Pokedex.Collections.PokemonToys([], { pokemon: this });
    return this._toys;
  },

  parse: function(jsonResp) {
    if (jsonResp.toys) {
      this.toys().set(jsonResp.toys); // {parse: true} needed if calling recursively
      delete jsonResp.toys; //what does this do?
    }
  // returns json without toys to default pokemon parser
    return jsonResp;
  }


}); // WRITE ME

Pokedex.Models.Toy = Backbone.Model.extend({


}); // WRITE ME IN PHASE 2

Pokedex.Collections.Pokemon = Backbone.Collection.extend({
  model: Pokedex.Models.Pokemon,
  url: "/pokemon"
}); // WRITE ME

Pokedex.Collections.PokemonToys = Backbone.Collection.extend({
  model: Pokedex.Models.Toy,

  initialize: function(models, options) {
    this.pokemon = options.pokemon;
    url: this.pokemon.url();
  }
});

window.Pokedex.Test = {
  testShow: function (id) {
    var pokemon = new Pokedex.Models.Pokemon({ id: id });
    pokemon.fetch({
      success: function () {
        console.log(pokemon.toJSON());
      }
    });
  },

  testIndex: function () {
    var pokemon = new Pokedex.Collections.Pokemon();
    pokemon.fetch({
      success: function () {
        console.log(pokemon.toJSON());
      }
    });
  }
};

window.Pokedex.RootView = function ($el) {
  this.$el = $el;
  this.pokes = new Pokedex.Collections.Pokemon();
  this.$pokeList = this.$el.find('.pokemon-list');
  this.$pokeDetail = this.$el.find('.pokemon-detail');
  this.$newPoke = this.$el.find('.new-pokemon');
  this.$toyDetail = this.$el.find('.toy-detail');

  this.$pokeList.on('click', 'li', this.selectPokemonFromList.bind(this) );
  this.$newPoke.on('submit', this.submitPokemonForm.bind(this));
  this.$pokeDetail.on('click', 'ul.toys > li', this.selectToyFromList.bind(this));
};

$(function() {
  var $rootEl = $('#pokedex');
	window.Pokedex.rootView = new Pokedex.RootView($rootEl);
  window.Pokedex.rootView.refreshPokemon();
});
