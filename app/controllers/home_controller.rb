class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:page]

  def page
  end

end
