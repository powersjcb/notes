Pokedex.RootView.prototype.addToyToList = function (toy) {
  // var $li = $('<li class="toy-list-item">');
  // $li.data('id', toy.get('id'));
  // $li.data('pokemon-id', toy.get('pokemon_id'));
  //
  // var shortInfo = ['name', 'happiness', 'price'];
  // shortInfo.forEach(function (attr) {
  //   $li.append(attr + ': ' + toy.get(attr) + '<br>');
  // });
  var toyPartial = JST['toyListItem']({toy: toy});
  this.$pokeDetail.find(".toys").append(toyPartial);
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) { // III
  this.$toyDetail.empty();

  // var $detail = $('<div class="detail">');
  // $detail.append('<img src="' + toy.escape('image_url') + '"><br>');
  // for (var attr in toy.attributes) {
  //   if(attr !== 'pokemon_id' && attr !== 'image_url') {
  //     var $span = $('<span style="font-weight:bold;">');
  //     $span.html(attr + ': ');
  //     $detail.append($span);
  //     $detail.append(toy.get(attr));
  //     $detail.append('<br>');
  //   }
  // }

  // Phase III
  // var $pokemonSelect = $('<select>');
  // $pokemonSelect.data("pokemon-id", toy.get("pokemon_id"));
  // $pokemonSelect.data("toy-id", toy.id);
  // this.pokes.each(function (pokemon) {
  //   var $pokemonOption = $('<option>');
  //   $pokemonOption.attr("value", pokemon.id);
  //   $pokemonOption.text(pokemon.get("name"));
  //   if (pokemon.id == toy.get("pokemon_id")) {
  //     $pokemonOption.prop("selected", true);
  //   }
  //   $pokemonSelect.append($pokemonOption);
  // });

  // $detail.append($pokemonSelect);
  var detail = JST['toyDetail']({toy: toy, pokes: this.pokes});
  this.$toyDetail.html(detail);
};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  var $target = $(event.target);

  var toyId = $target.data('id');
  var pokemonId = $target.data('pokemon-id');

  var pokemon = this.pokes.get(pokemonId);
  var toy = pokemon.toys().get(toyId);

  this.renderToyDetail(toy);
};
