class DadJokesController < ApplicationController
  def index
    @dad_jokes = DadJoke.all
  end

  def new
    @dad_joke = DadJoke.new
  end

  def create
    dad_joke = DadJoke.new(dad_joke_params)
    if dad_joke.save
      redirect_to dad_joke_path(dad_joke)
    else
      render :new
    end
  end

  def show
    @dad_joke = DadJoke.find(params[:id])
  end

  private

  def dad_joke_params
    params.require(:dad_joke).permit(:question, :answer, :like_count)
  end

end
