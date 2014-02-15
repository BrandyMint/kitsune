class WelcomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to controller: :sites, action: :index
    end
  end
end
