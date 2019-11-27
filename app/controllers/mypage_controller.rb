class MypageController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bettings = Betting.where(user_id: current_user.id)
    @total_investment = 0
    @total_result = 0
    @bettings.each do |betting|
      @total_investment += betting.investment
      if betting.result
        @total_result += betting.result
      end
    end
    @years = Betting.where(user_id: current_user.id).where(when: Time.local(Date.today.year).all_year)
    @total_year_investment = 0
    @total_year_result = 0
    @years.each do |year|
      @total_year_investment += year.investment
      if year.result
        @total_year_result += year.result
      end
    end
    @month = Betting.where(user_id: current_user.id).where(when: Time.local(Date.today.year, Date.today.month).all_month)
    @total_month_investment = 0
    @total_month_result = 0
    @month.each do |month|
      @total_month_investment += month.investment
      if month.result
        @total_month_result += month.result
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      render :show
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  
end
