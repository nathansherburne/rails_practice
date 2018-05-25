require 'sinatra/base'

module Sinatra
  module UserHelper
    def greet_user(username)
      "Hello there, #{username}!"
    end
  end
end

