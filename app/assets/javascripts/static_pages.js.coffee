$ ->
  player_one_name = prompt "Player one: "
  player_two_name = prompt "Player two: "
  player_three_name = prompt "Player three: "

  player_one_div = $('#player_one')
  player_two_div = $('#player_two')
  player_three_div = $('#player_three')

  player_one_points = 0
  player_two_points = 0
  player_three_points = 0

  $('#player_one').append("#{player_one_name}: Q")
  $('#player_two').append("#{player_two_name}: B")
  $('#player_three').append("#{player_three_name}: P")

  assign_player = () ->
    switch event.keyCode
      when 113
        window.player = player_one_name
        player_one_div.addClass('highlight')
      when 98
        window.player = player_two_name
        player_two_div.addClass('highlight')
      when 112
        window.player = player_three_name
        player_three_div.addClass('highlight')

  $(document).on('keypress', assign_player)

  show_game = () ->
    ###
    pull in data from home.html.haml '#game' data attribute to get current question number
    when you first start the application, the data attribute has a value of 0
    every time the next question is shown, the data attribute on the '#game' div is
    incremented by 1
    ###
    question_data =
      id: $('#game').attr('data-question-id')

    $.ajax
      url: "static_pages/show_game"
      data: question_data


  handle_answer = (response) ->
    correct_answer = () ->
      console.log window.player
      console.log player_one_name
      switch window.player
        when player_one_name
          player_one_points++
          console.log player_one_points
          $('#player_one .points').empty().append(player_one_points)
        when player_two_name
          player_two_points++
          $('#player_two .points').empty().append(player_two_points)
        when player_three_name
          player_three_points++
          $('#player_three .points').empty().append(player_three_points)

    if response.is_correct == true
      console.log "got to true"
      correct_answer()
    else
      console.log "got to false"
      wrong_answer()

  check_answer = () ->
    answer_data =
      answer_id: $(this).attr('id')

    $.ajax
      url: "static_pages/check_answer"
      data: answer_data
      success: handle_answer


  # starts the game
  $('button').on('click', show_game)

  # checks to see if an answer is correct and handles the response
  # uses $(document).on('click', '.answer') syntax because when this JS file is loaded
  # '.answer' is not yet on the page
  $(document).on('click', '.answer', check_answer)