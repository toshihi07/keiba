class BettingsController < ApplicationController
  before_action :authenticate_user!
  def new
    @betting = Betting.new
    @categories = Category.where(ancestry: nil)
  end
  def create
    @betting = Betting.new(betting_params)
    if @betting.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  def result
    betting = Betting.find(params[:id])
    betting.update_attributes(result: params[:result])
    redirect_to mypage_path(current_user)
  end
  def category_children
    @children = Category.find(params[:category]).children
  end
end
private
def betting_params
  horse_number = params['bettings']['horse_number'].join(",")
  params.require(:bettings).permit(:when, :race_course_id, :race_number_id, :race_name, :category_id, :investment).merge(user_id: current_user.id, horse_number: horse_number)
end