class TravelersController < ApplicationController

  def myprojects
    @myprojects = current_user.projects
  end

end
