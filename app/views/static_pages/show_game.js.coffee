$game = $('#game')

# This replaces the contents of the #game div with the partial for a game
$game.html("<%= j render 'game' %>")

# This changes the data attribute of the #game div to the current question's id
# which is higher than the previous question's id
$game.attr('data-question-id', '<%= @question.id %>')