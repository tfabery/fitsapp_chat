class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_chats_path
    else
      user_path(current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
