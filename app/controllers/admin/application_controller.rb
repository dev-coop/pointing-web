class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_admin!

  def authenticate_admin!
    authenticate_user!
  end

end