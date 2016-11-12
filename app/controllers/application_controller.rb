class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionController::ImplicitRender #Handles implicit rendering for a controller action that does not explicitly respond with render, respond_to, redirect, or head.
  respond_to :json

end
