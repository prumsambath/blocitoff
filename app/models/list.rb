class List < ActiveRecord::Base
  belongs_to :users

  validates :name, presence: true
end
