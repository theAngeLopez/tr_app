class Encounter < ApplicationRecord
  validates :visit_number, :admitted_at, presence: true
end
