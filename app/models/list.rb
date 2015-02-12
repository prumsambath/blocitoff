class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true

  default_scope { order(:name) }

  def complete_items
    items.where('completed = ?', true)
  end

  def incomplete_items
    items.where('completed = ?', false)
  end
end
