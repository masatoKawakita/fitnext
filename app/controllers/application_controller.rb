class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    users_show_path
  end

private
  def sign_in_required
    redirect_to homes_url unless user_signed_in?
  end
end
