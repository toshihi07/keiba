class RaceGroupsController < ApplicationController

  def index
    @race_groups = RaceGroup.where(year: 2019).order("created_at DESC")
    @main_race_group = RaceGroup.where(name: "エリザベス女王杯")
  end

  def show
    @race_group = RaceGroup.find(params[:id])
    @posts = Post.all
    @main_race_group = RaceGroup.where(name: "エリザベス女王杯")
  end
end

