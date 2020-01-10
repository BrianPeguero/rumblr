class LogoutController < ApplicationController

    def index
        session[:user_id] = nil
        redirect_to :controller => "welcome", :action => "index"
    end

end
