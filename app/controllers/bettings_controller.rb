class BettingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:id])
    @betting = Betting.new
  end

  def create
    @betting
  end

end

private

def betting_params
end