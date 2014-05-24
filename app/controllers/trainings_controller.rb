class TrainingsController < ApplicationController

  before_action :signed_in_user, only: [:create, :update, :destroy]


  def index
  end


  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      flash[:success] = "練習記録を作成しました"

      redirect_to root_url
    else
      flash.now[:error] = 'エラー'
      # render 'shared/create_form'
    end
  end


  def update
    @training = Training.find_by_id(params[:id])

    if @training.update_attributes(training_params)
      flash[:success] = "練習記録を更新しました"

      redirect_to root_url
    else
      flash.now[:error] = 'エラー'
      # render 'shared/edit_form'
    end
  end


  def destroy
    Training.find(params[:id]).destroy
    flash[:success] = "練習記録を削除しました"

    redirect_to root_url
  end


  private

  def training_params
    params.require(:training).permit(:date, :condition, :training_detail, :running_distance)
  end


end
