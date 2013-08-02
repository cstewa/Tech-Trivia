$ ->
  player_one = prompt "Player one: "
  player_two = prompt "Player two: "
  player_three = prompt "Player three: "

  $('#player_one').append("#{player_one}: Q")
  $('#player_two').append("#{player_two}: B")
  $('#player_three').append("#{player_three}: P")

  $('button').on('click', reveal_game)

  show_question = () ->
    $.ajax
      url: "static_pages/home"
      data:


  reveal_game = () ->
    $('#game').css("display", "block")
    show_question


  start_game