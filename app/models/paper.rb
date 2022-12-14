class Paper < ApplicationRecord
    validates :title, presence: true
    validates :venue, presence: true
    validates :year, presence: true, numericality: { other_than: 0 }

    has_and_belongs_to_many :authors
    scope :published, ->(year) { where("year == ?", year)}
end
