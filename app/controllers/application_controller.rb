class ApplicationController < ActionController::Base

  before_filter :authenticate_contact!
  protect_from_forgery
end
