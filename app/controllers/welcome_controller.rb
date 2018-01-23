# we generate Rails controllers by running: rails g controller welcome
# controllers are classes whose name end with `Controller` and they all should
# be inside the /app/controllers folder
class WelcomeController < ApplicationController
  # methods defined within controllers are called `actions`
  def index
    # render :index
    # 👆 the line above is implied by a Rails convention so you don't have to
    # expicilty put it. If the action name is `index` then Rails will render
    # a view file `/app/views/welcome/` called `index.html.erb`
    # index: matches the action name
    # html: is the format (html by default)
    # erb: is the templating system (erb is the default)
  end

  def about
  end
end
