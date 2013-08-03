class StaticPagesController < ApplicationController
  def home
  end

  def show_game
    @question = Question.where("id > ?", id).first
  end
end
