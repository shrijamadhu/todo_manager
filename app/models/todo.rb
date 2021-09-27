class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_complete = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text}     #{due_date} #{is_complete} "
  end


end
