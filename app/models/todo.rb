class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_complete = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text}     #{due_date} #{is_complete} "
  end
  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

end
