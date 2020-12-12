class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true

    belongs_to :category
    belongs_to :user
end
