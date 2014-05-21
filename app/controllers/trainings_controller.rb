class TrainingsController < ApplicationController

  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      flash[:success] = "練習記録を作成しました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def training_params
    params.require(:training).permit(:date, :condition, :training_detail, :running_distance)
  end

end
