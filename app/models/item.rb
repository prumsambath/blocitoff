class Item < ActiveRecord::Base
  belongs_to :list
  after_create :set_to_incomplete

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end

  private

  def set_to_incomplete
    self.update(completed: false)
  end
end
