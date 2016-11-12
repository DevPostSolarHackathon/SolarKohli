class WelcomeController < ApplicationController
  def index
  end

  def webhook
     render :json => {:hello => "Hello"}
  end

  def verify

    render :json => {:hello => "asda"}
  end

end
