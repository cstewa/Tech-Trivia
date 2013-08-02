$ ->
  player_one = prompt "Player one: "
  player_two = prompt "Player two: "
  player_three = prompt "Player three: "

  $('#player_one').append("#{player_one}: Q")
  $('#player_two').append("#{player_two}: B")
  $('#player_three').append("#{player_three}: P")

  start_game = () ->
