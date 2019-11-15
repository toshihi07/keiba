class BettingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @betting = Betting.new
  end

  def create
    # binding.pry
    @betting = Betting.new(betting_params)
    if @betting.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end 
end

private

def betting_params
  params.require(:bettings).permit(:when, :race_course_id, :race_number_id, :race_name, :category_id,:horse_number_id, :investment).merge(user_id: current_user.id)
end