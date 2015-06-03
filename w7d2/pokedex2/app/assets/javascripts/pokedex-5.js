Pokedex.Views = {}
// $(function() {
//   var $rootEl = $('#pokedex');
//   window.Pokedex.rootView = new Pokedex.RootView($rootEl);
//   window.Pokedex.rootView.refreshPokemon();
// });
Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
    'click li.poke-list-item': 'selectPokemonFromList'
  },

  initialize: function () {
    this.pokes = new Pokedex.Collections.Pokemon();
    console.log('fetching pokes');
    this.pokes.fetch();

    this.listenTo(this.pokes, "sync", this.render);
    this.listenTo(this.pokes, "add", this.render);
  },

  addPokemonToList: function (pokemon) {
    var content = JST['pokemonListItem']({ pokemon: pokemon});
    this.$el.append(content);
  },

  refreshPokemon: function (options) {
    this.render()
  },

  render: function () {
    this.$el.empty();
    // disable listener
    this.pokes.each( function(pokemon) {
      this.addPokemonToList(pokemon);
    }.bind(this));
    // fire trigger, turn listener back on
  },

  selectPokemonFromList: function (event) {
    var $target = $(event.currentTarget);
    var pokeId = $target.data('id');
    var pokemon = this.pokes.get(pokeId);

    Backbone.history.navigate("pokemon/" + pokemon.id, {trigger: true});
  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
    'click li.toy-list-item': 'selectToyFromList'
  },

  initialize: function () {
    this.$el = $('.pokemon-detail');
    this.listenTo(this.model, 'sync add', this.render);
  },

  refreshPokemon: function (options) {
    this.render();
    this.model.fetch();
  },

  render: function () {
    this.$el.empty();
    var content = JST['pokemonDetail']({pokemon: this.model});
    this.$el.append(content);

    this.model.toys().forEach( function(toy) {
      var toyPartial = JST['toyListItem']({toy: toy});
      this.$el.append(toyPartial);
    }.bind(this));
  },

  selectToyFromList: function (event) {
    var $target = $(event.currentTarget);
    var toys = this.model.toys();
    var toy = toys.get($target.data('id'));
    this.toyDetail = new Pokedex.Views.ToyDetail({model: toy});
    //this is better practice
    $('.toy-detail').html(this.toyDetail.render().$el);
  }
});


Pokedex.Views.ToyDetail = Backbone.View.extend({

  initialize: function () {
    this.pokes = new Pokedex.Collections.Pokemon();
    this.pokes.fetch();
    this.listenTo(this.pokes, "sync", this.render);
    this.listenTo(this.model, 'sync add', this.render);
  },

  render: function () {
    this.$el.empty();
    var toyDetail = JST['toyDetail']({toy: this.model, pokes: this.pokes});
    this.$el.append(toyDetail);
    return this;
  }
});


// $(function () {
//   var pokemonIndex = new Pokedex.Views.PokemonIndex();
//   pokemonIndex.refreshPokemon();
//   $("#pokedex .pokemon-list").html(pokemonIndex.$el);
// });
