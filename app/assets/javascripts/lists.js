$(document).ready(function() {
  $('a .item').on('mouseover', function() {
    $(this).removeClass();
    $(this).addClass('glyphicon glyphicon-ok');
  });
  $('a .item').on('mouseleave', function() {
    $(this).removeClass();
    $(this).addClass('glyphicon glyphicon-unchecked');
  });
});
