class TodoController < Sinatra::Base

  get '/hello' do
    "Welcome to TodoController"
  end

  post '/todos/create' do
    data = JSON.parse(request.body.read)


    # resque block
    begin
      # approach 1 (individual columns)
        # title = data["title"]
        # description = data["description"]
        # todo = Todo.create(title: title, description: description, createdAt: today)
        # todo.to_json

      # approach 2 (hash of a column)
        today = Time.now
        data["createdAt"] = today
        todo = Todo.create(data)
        todo.to_json

    rescue => e
     [422 , {
        error: e.message
      }.to_json]
  end
end

    get "/todos" do
      todos = Todo.all
      todos.to_json
    end

    put "/todos/update/:id" do
      begin
        data = JSON.parse(request.body.read) # added when we need data in the body
        todo_id = params["id"].to_i
        todo = Todo.find(todo_id)
        data.delete(data)
        todo.update(data)
        {
          message: "todo updated successfully"
        }.to_json
      rescue => e
        {
          error: e.message
        }
      end
    end


    delete '/todos/destroy/:id' do
      begin
        todo_id = params["id"].to_i
        todo = Todo.find(todo_id)
        todo.destroy
        {message: "todo deleted successfully"}.to_json
        rescue => e
          [422,  {error: e.message}.to_json]
      end
    end


end
