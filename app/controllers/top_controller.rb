class TopController < ApplicationController

  def index
    @articles = Article.all.includes(:article_images).limit(6).order("created_at DESC")
    @race_group = RaceGroup.where(name: "有馬記念")
  end

  def show
    @race_group = RaceGroup.find(params[:id])
  end

end
