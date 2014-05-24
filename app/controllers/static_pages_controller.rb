class StaticPagesController < ApplicationController

  #before_action :signed_in_user, only: [:home]

  def home
    if signed_in?
      @training = current_user.trainings.build if signed_in?

      @userId = current_user
      @user = User.find(@userId)

      tr = @user.trainings.all.select(:id, 'date AS start', 'training_detail AS title' , :condition, :running_distance)
      @trainings = ActiveSupport::JSON.encode(tr)
    end
  end


  def about
  end

end
