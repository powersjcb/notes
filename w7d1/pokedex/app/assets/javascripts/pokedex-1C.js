Pokedex.RootView.prototype.createPokemon = function (attrs, callback) {
  var newPokemon = new Pokedex.Models.Pokemon(attrs);

  newPokemon.save({}, {
    success: function (poke, response) {
      this.pokes.push(poke);
      this.addPokemonToList(poke);
      callback && callback(poke);

      // if (callback) {
      //   callback(poke);
      // }
    }.bind(this),

    error: function(poke, response) {
      console.log(response.statusText);
    }
  });

};

Pokedex.RootView.prototype.submitPokemonForm = function (event) {
  event.preventDefault();
  var pokeAttrs = $(event.currentTarget).serializeJSON().pokemon;
  this.createPokemon(pokeAttrs, this.renderPokemonDetail.bind(this));

};


// {"attack":45,"defense":35,"image_url":"/assets/pokemon_snaps/041.png","moves":["astonish","bite","wing attack"],"name":"Zubatoo","poke_type":"poison"}
