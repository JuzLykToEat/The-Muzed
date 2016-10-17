class Schedule < ApplicationRecord
  belongs_to :subject
  has_many :timeslots
end
