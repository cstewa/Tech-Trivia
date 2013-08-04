QuizGame::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/show_game"
  get "static_pages/check_answer"
  get "static_pages/end_game"
  root to: 'static_pages#home'
end
