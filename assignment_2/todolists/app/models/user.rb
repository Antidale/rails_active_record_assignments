class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy

  def get_completed_count
    todo_items.where(completed: true).count
  end

  validates :username, presence: true


end
