QuizGame::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/show_game"
  root to: 'static_pages#home'
end
