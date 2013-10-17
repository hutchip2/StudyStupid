//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
  buildDecks();
  buildFlashcardCanvas();
  buildShowEditDestroy();
  buildLeftScroll();
  buildRightScroll();
  flipFlashcard();
});

function drawFlashcardLines(context, width) {
  context.lineWidth = width;
  for (var i = 1; i < 10; i++) {
    context.beginPath();
    context.moveTo(0,15*i);
    context.lineTo(300,15*i);
    if (i == 1) {
      context.strokeStyle = '#c6757e';
    } else {
      context.strokeStyle = '#a0d6dd';
    }
    context.stroke();
  }
}

function buildFlashcardCanvas() {
  window.flashcards = new Array();
  window.current_card = 0;
  var canvas = document.getElementById("card");
  var context = canvas.getContext('2d');
  var x = canvas.width / 3;
  var y = canvas.height / 2;
  context.font = '20pt Calibri';
  context.fillStyle = 'blue';
  context.fillText("Flashcards", x, y);
}

function buildDecks() {
  var deckTitles = $('#deckTitles').text().split(',');
  for (var i = 0; i < deckTitles.length; i++) {
    var card    = document.getElementById("card");
    var context = card.getContext('2d');
    drawFlashcardLines(context,1);
    var canvas  = document.getElementById("deck"+i);
    var context = canvas.getContext('2d');
    var x = canvas.width / 3;
    var y = canvas.height / 2;
    drawFlashcardLines(context,1);
    var title = deckTitles[i];
    context.font = '20pt Calibri';
    context.fillStyle = 'blue';
    context.fillText(title, x, y);
  }
}

function buildShowEditDestroy() {
  var deckCount = $('#deckTitles').text().split(',').length;
  for (var i = 0; i < deckCount; i++) {
    var show     = document.getElementById("show"+i);
    var edit     = document.getElementById("edit"+i);
    var destroy  = document.getElementById("destroy"+i);
    var showctx     =    show.getContext('2d');
    var editctx     =    edit.getContext('2d');
    var destroyctx  = destroy.getContext('2d');
    showctx.font = '150pt Calibri';
    showctx.fillStyle = 'black';
    showctx.fillText('S', show.width/3, show.height);
    editctx.font = '150pt Calibri';
    editctx.fillStyle = 'black';
    editctx.fillText('E', edit.width/3, edit.height);
    destroyctx.font = '150pt Calibri';
    destroyctx.fillStyle = 'black';
    destroyctx.fillText('D', destroy.width/3, destroy.height);
    show.onclick = function() {
      window.location = "/decks/"+i;
    }
    edit.onclick = function() {
      window.location = "/decks/"+ i +"/edit";
    }
    destroy.onclick = function() {
      //window.location = "/decks/<%=deck.id%>";
      //<td><%= link_to 'Destroy', deck, method: :delete, data: { confirm: 'Are you sure?' } %></td>
    }
  }
}

function buildLeftScroll() {
  $('#button_left').each(function () {
    var hovered = false;
    var loop = window.setInterval(function () {
      if (hovered) {
        $("#button_left").css("color", "red");
        var leftPos = $('#decks_outer').scrollLeft();
        $('#decks_outer').animate({scrollLeft: leftPos - 50});
      } else {
        $("#button_left").css("color", "blue"); }
    }, 500);
    $(this).hover( function () { hovered = true; }, function () { hovered = false;} );
  });
}

function buildRightScroll() {
  $('#button_right').each(function () {
    var hovered = false;
    var loop = window.setInterval(function () {
      if (hovered) {
        $("#button_right").css("color", "red");
        var leftPos = $('#decks_outer').scrollLeft();
        $('#decks_outer').animate({scrollLeft: leftPos + 50});
      } else {
        $("#button_right").css("color", "blue"); }
    }, 500);
    $(this).hover( function () { hovered = true; }, function () { hovered = false;} );
  });
}

function flipFlashcard() {
  $(document).keydown(function(e) {
    if (e.keyCode == '32') {
      window.current_card++;
      if (window.current_card >= window.flashcards.length)  {
        window.current_card = 0;
      }
      var curCard = window.flashcards[window.current_card];
      if (window.flashcards.length == 0)  {
        curCard = "<empty>";
      }
      var canvas = document.getElementById("card");
      canvas.width = canvas.width;
      var context = canvas.getContext('2d');
      var x = canvas.width / 3;
      var y = canvas.height / 2;
      context.lineWidth = 2;
      for (var i = 1; i < 10; i++) {
        context.beginPath();
        context.moveTo(0,15*i);
        context.lineTo(300,15*i);
        if (i == 1) {
          context.strokeStyle = '#c6757e';
        } else {
          context.strokeStyle = '#a0d6dd';
        }
        context.stroke();
      }
      context.font = '20pt Calibri';
      context.fillStyle = 'blue';
      context.fillText(curCard, x, y);
    }
  });
}
