class ApplicationController < ActionController::Base
  protect_from_forgery

protected

  ### CanCan Stuff ###

  def current_user
    current_account
  end

  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

  # Authenticated and Authorized
  def auth_for_admin!
    authenticate_account! && authorize_for_admin!
  end

  def authorize_for_admin!
    current_ability.authorize! :read, ActiveAdmin::Page, :name => 'Dashboard'
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # Override from Devise to customize redirect hooks
  # check session["#{scope}_return_to"]
  # check omniauth origin
  # check for admin
  # finally go to root
  def after_sign_in_path_for(account)
    stored = stored_location_for(account)# || request.env['omniauth.origin']
    stored ? stored : account.admin? ? admin_root_path : signed_in_root_path(account)
  end

end
