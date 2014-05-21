class StaticPagesController < ApplicationController
  def home
    @training = current_user.trainings.build if signed_in?
  end

  def help
  end

  def about
  end

end
