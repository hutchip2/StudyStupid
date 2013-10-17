//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



// Keydown function for flipping flashcard
$(document).ready(function() {
  $(document).keydown(function(e) {
    if (e.keyCode == '32') {
      //alert(window.flashcards.length);
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
});

// Make flashcard canvas
$(document).ready(function() {

  window.flashcards = new Array();
  window.current_card = 0;

  var canvas = document.getElementById("card");
  var context = canvas.getContext('2d');
  var x = canvas.width / 3;
  var y = canvas.height / 2;
  context.font = '20pt Calibri';
  context.fillStyle = 'blue';
  context.fillText("Flashcards", x, y);
});

// Left scroll function for deck button
$(document).ready(function() {
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
});

/*$(document).ready(function() {
  $("#button_left").mouseover(function() {
    $("#button_left").css("color", "red");
    var leftPos = $('#decks_outer').scrollLeft();
    $('#decks_outer').animate({scrollLeft: leftPos - 10});
  }).mouseout(function(){
    $("#button_left").css("color", "blue");
  });
});*/

// Right scroll function for deck button
$(document).ready(function() {
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
});