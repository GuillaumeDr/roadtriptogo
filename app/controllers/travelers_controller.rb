class TravelersController < ApplicationController

  def myprojects
    @myprojects = current_user.skis
  end

end
