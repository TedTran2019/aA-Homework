class Toy < ApplicationRecord
  validates :name, uniqueness: { scope: [:toyable] }
  validates :toyable, presence: true

  belongs_to :toyable, polymorphic: true
end
