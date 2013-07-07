class WelcomeController < ApplicationController
  before_filter :authenticate_account!

  # GET /
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.rjs
    end
  end

end
