# We only find ourselves here if the authentication to provider was successful.
class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #skip_before_filter :verify_authenticity_token, only: :ldap

  def ldap
    auth = request.env['omniauth.auth']
    link_providor_or_sign_in(auth, 'Miami Login', true) # trust that miami emails are verified
  end

  def google_oauth2
    auth = request.env['omniauth.auth']
    link_providor_or_sign_in(auth, 'Google', auth.extra.raw_info.verified_email) # ask google if email is verified
  end

  def facebook
    auth = request.env['omniauth.auth']
    link_providor_or_sign_in(auth, 'Facebook', auth.extra.raw_info.verified) # ask facebook if email is verified
  end

protected

  # Do it all...
  def link_providor_or_sign_in(auth, provider, skip_confirmation=false)
    logger.debug("[Omniauth callback] #{provider} ----- #{auth.inspect}")
    account_signed_in? ? link_new_provider(auth, provider) : sign_in_with_or_create_identity(auth, provider, skip_confirmation)
  end

  # Link new provider to account (if already signed in).
  def link_new_provider(auth, provider)
    @identity = Identity.find_or_build_with_omniauth(auth)

    if @identity.persisted? and (@identity.account == current_account)
      # Found existing identity, but its already linked to the current signed in account.
      redirect_to root_url, alert: I18n.t("devise.omniauth_callbacks.failure_link", :kind => provider)
      # redirect_to identity page
    else
      # Identity is new or is not linked to the current signed in account.
      @identity.account = current_account
      if @identity.save
        redirect_to root_url, notice: I18n.t("devise.omniauth_callbacks.success_link", :kind => provider)
        # redirect_to identity page
      else
        redirect_to root_url, alert: I18n.t("devise.omniauth_callbacks.identity_fail", :kind => provider)
        # render identity page that will show @identity.errors
      end
    end
  end

  # Sign in the user, with identity, creating an identity and account as necessary.
  def sign_in_with_or_create_identity(auth, provider, skip_confirmation=false)
    @identity = Identity.find_or_build_with_omniauth(auth)

    if (@identity.persisted? and @identity.account.present?)
      # Found existing identity and it has an account, so just sign in
      sign_in_account(@identity.account, provider)
    else
      # No account associated with the identity so we need to create a new one
      @identity.destroy # An identity with no account is bad, so destroy it and start over

      # Try to create a new acocunt/with identity
      new_account = Account.new
      @identity = Identity.find_or_build_with_omniauth(auth, new_account, skip_confirmation) # should always be a new identity
      if new_account.save
        sign_in_account(@identity.account, provider)
      else
        # We need this person to fill out more info than their provider gave us
        session['devise.omniauth_data'] = auth # save auth to session for use later
        redirect_to new_account_registration_url, notice: I18n.t("devise.omniauth_callbacks.account_fail", :kind => provider)
      end
    end
  end

  # Actually sign the account in.
  def sign_in_account(account, provider)
    flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => provider)
    sign_in_and_redirect account, :event => :authentication
  end

end
