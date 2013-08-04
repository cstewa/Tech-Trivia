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
    unless window.player
      switch event.keyCode
        when 113
          window.player = player_one_name
          window.player_div = player_one_div
          window.player_points = player_one_points
          window.player_points_div = $('#player_one .points')
          player_one_div.addClass('highlight')
        when 98
          window.player = player_two_name
          window.player_div = player_two_div
          window.player_points = player_two_points
          window.player_points_div = $('#player_two .points')
          player_two_div.addClass('highlight')
        when 112
          window.player = player_three_name
          window.player_div = player_three_div
          window.player_points = player_three_points
          window.player_points_div = $('#player_three .points')
          player_three_div.addClass('highlight')

  show_game = () ->
    $(document).on('keypress', assign_player)

    # Clear out data from previous question
    window.player = null
    $('.correct').empty()

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
      window.player_points++
      window.player_points_div.empty().append(window.player_points)
      window.player_div.removeClass('highlight')

      $('.correct').append("Correct!")
      setTimeout(show_game, 2000)

    wrong_answer = () ->
      $('.correct').append("Wrong answer :(")
      window.player_div.removeClass('highlight')
      setTimeout(show_game, 2000)


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