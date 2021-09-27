class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render plain: Todo.order(:due_date).map{|todo| todo.to_pleasant_string}.join("\n")
  end
  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end
  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text,due_date: due_date,completed: false)
    render plain: "hey! created new todo with id #{new_todo.id}"
  end
  def update
    id = params[:id]
    completed = params[:completed]
    new_todo = Todo.find(id)
    new_todo.completed = completed
    new_todo.save!
    render plain: "update done for id #{id}"
  end


end
