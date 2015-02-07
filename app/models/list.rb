class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true

  default_scope { order(:name) }

  def completed_items
    items.where('completed = ?', true)
  end

  def incompleted_items
    items.where('completed = ?', false)
  end
end
