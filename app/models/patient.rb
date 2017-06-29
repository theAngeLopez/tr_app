class Patient < ApplicationRecord
  validates :first_name, :middle_name, :mrn, presence: true
end
