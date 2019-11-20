class TopController < ApplicationController

  def index
    @articles = Article.all.includes(:article_images).limit(6).order("created_at DESC")
    @race_group = RaceGroup.where(name: "エリザベス女王杯")
  end

  def show
    @race_group = RaceGroup.find(params[:id])
  end

end
