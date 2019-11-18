class RaceGroupsController < ApplicationController

  def index
    @race_groups = RaceGroup.where(year: 2019)
  end
  
end

