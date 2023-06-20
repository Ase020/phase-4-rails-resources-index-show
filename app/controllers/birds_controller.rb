class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species], status: :ok
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:id, :name, :species], status: :ok
    else
      render json: {error:'bird not found!'}, status: :not_found
    end
  end
end
