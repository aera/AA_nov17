class ContactController < ApplicationController
  def new
  end

  def create
    # parameters come to use like this:
    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"3FJqFJLYdRdUOMNw08aDIaAmBsXN2YJiTUXUo9iQnioORv/u16EpuQRCpDHNkwm3hDjn5VkBbXf3uZWUD+igIA==", "name"=>"Sd f", "message"=>"asd fa", "commit"=>"Contact Us"}
    # we can access them using the `param` hash provided by Rails.
    # Note that you can access them with symbols or string (Rails feature)
    # if you assign an instance variable in the action, you can use the instance
    # variable in the view file (in this case within create.html.erb)
    @name = params[:name]
    @message = params[:message]
  end
end
