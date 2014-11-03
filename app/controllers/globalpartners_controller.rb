class GlobalpartnersController < ApplicationController

  before_action :authenticate_user!

  def index
    unless current_user.admin
      return redirect_to root_path
    end
	end

end