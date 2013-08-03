$ ->
  player_one = prompt "Player one: "
  player_two = prompt "Player two: "
  player_three = prompt "Player three: "

  $('#player_one').append("#{player_one}: Q")
  $('#player_two').append("#{player_two}: B")
  $('#player_three').append("#{player_three}: P")


  show_game = () ->
    # pull in data from home.html.haml
    console.log('show_game')
    $.ajax
      url: "static_pages/show_game"



  # starts the game
  $('button').on('click', show_game)