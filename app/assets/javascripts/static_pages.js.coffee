$ ->
  player_one = prompt "Player one: "
  player_two = prompt "Player two: "
  player_three = prompt "Player three: "

  $('#player_one').append("#{player_one}: Q")
  $('#player_two').append("#{player_two}: B")
  $('#player_three').append("#{player_three}: P")


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
    # correct_answer = () ->
    #   $('.answer#'+response.answer)

    if response.is_correct
      correct_answer()
    else
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