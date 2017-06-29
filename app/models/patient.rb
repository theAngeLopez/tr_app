class Patient < ApplicationRecord
  validates :first_name, :middle_name, :mrn, presence: true

  has_many :encounters, dependent: :destroy
end
