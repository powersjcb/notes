(function() {
  if (typeof Hanoi === "undefined") {
    window.Hanoi = {};
  }

  var View = Hanoi.View = function (game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
  };

  View.prototype.setupTowers = function() {
    for (var i = 0; i < 3; i++) {
      this.$el.append($('<div>').addClass('pillar').attr("id", i));
    }
    this.render();
  };

  View.prototype.render = function() {
    $('.pillar').html("");
    this.game.towers.forEach( function (tower, i) {
      tower.forEach( function (disc) {
        $(".pillar#"+i).append($("<div>").addClass('disc ' + "disc" + disc));
      });
    });
    // this.$el.
  };

  View.prototype.clickTower = function() {
    var that = this;
    var idBuffer = -1;
    $('.pillar').on('click', function(event) {

      var $clickedPillar = $(event.currentTarget);
      var id = $clickedPillar.attr('id');
      if (idBuffer === -1) {
        idBuffer = id;
        $clickedPillar.addClass('clicked');
      } else {
        that.makeMove(idBuffer, id)
        idBuffer = -1;
        $('.pillar').removeClass('clicked');

        if (that.game.isWon()) {
          $('.winning').show();
        }
      }
    });
  }

  View.prototype.makeMove = function(startId, endId) {
    if (!this.game.move(startId, endId)) {
      alert("Invalid move!");
    }
    this.render();
    this.game.print();
  }
})();
