class StaticPagesController < ApplicationController
  def home
  end

  def show_game
    # params[:id] is sent by static_page.js.coffee in the data part of the ajax call
    # the logic below takes the first question that has an id greater than params[:id]
    # the ('id > ?, id') syntax is just another way of querying SQL
    ## the params[:id] just replaces the question mark
    @question = Question.where("id > ?", params[:id]).first
  end
end
