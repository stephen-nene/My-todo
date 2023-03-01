class TodoController < Sinatra::Base
  get '/hello' do
    "Welcome to TodoController"
  end

  post '/todos/create' do
    data = request.body.read
    data.to_s
  end

end
