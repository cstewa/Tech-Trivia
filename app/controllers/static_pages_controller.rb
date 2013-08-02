class StaticPagesController < ApplicationController
  def home
    @question = Question.find(params[:question])
  end
end
