class ApplicationController < ActionController::Base
  protect_from_forgery prepend: :exception
end
#true, with: