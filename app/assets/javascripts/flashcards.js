//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
  makeFlashcardCanvas();
  flipFlashcard();
  addDeckMenus();
});

function addDeckMenus () {
  for (var i = 0; i < window.decks.length; ++i) {
    var dropdown = document.getElementById("dropdown"+i);
    dropdown.i = i;
    dropdown.onclick = dropdownListener;

    var show = document.getElementById("show"+i);
    show.i = i;
    show.onclick = showListener;
/*
    var edit = document.getElementById("edit"+i);
    edit.i = i;
    edit.onclick = editListener;

    var destroy = document.getElementById("destroy"+i);
    destroy.i = i;
    destroy.onclick = destroyListener;
*/
  }
}

function dropdownListener() {
  var element = $('#list' + this.i);
  element.slideToggle();
  event.preventDefault();
}

function showListener() {
  var element = $('#show' + this.i);
  window.location = "/decks/"+i;
}

function editListener() {
  var element = $('#edit' + this.i);
  window.location = "/decks/"+i+"/edit";
}

function destroyListener() {
  var element = $('#destroy' + this.i);
  //window.location = "/decks/"+i;
}

function makeFlashcardCanvas() {
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
