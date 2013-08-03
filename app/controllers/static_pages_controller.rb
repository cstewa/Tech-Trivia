class StaticPagesController < ApplicationController
  def home
  end

  def show_game
    # params[:id] is sent by static_page.js.coffee in the data part of the ajax call of the show_game function
    # the logic below takes the first question that has an id greater than params[:id]
    # the ('id > ?, id') syntax is just another way of querying SQL
    ## the params[:id] just replaces the question mark
    @question = Question.where("id > ?", params[:id]).first
  end

  def check_answer
    # This finds the answer based on the answer_id sent from static_pages.js.coffee in the
    # check_answer function
    @answer = Answer.find(params[:answer_id])

    # This sends back the truthy/falsiness of the answer as json, which goes BACK to
    # static_pages.js.coffee and is picked up on success of the check_answer ajax call
    render json: {answer: @answer.id, is_correct: @answer.is_correct}
  end
end
