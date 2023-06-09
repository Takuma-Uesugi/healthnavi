class ApplicationController < ActionController::Base
  def after_sign_in_path_for(model)
    if user_signed_in?
      user_path(model)
    elsif adviser_signed_in?
      adviser_path(model)
    end
  end
end