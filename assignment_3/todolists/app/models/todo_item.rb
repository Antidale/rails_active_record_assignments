class TodoItem < ActiveRecord::Base

  def self.completed_todo_item_count
    TodoItem.all.where(completed: true).count
  end
end
