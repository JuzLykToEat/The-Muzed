class Timeslot < ApplicationRecord
  belongs_to :schedule
  belongs_to :user, optional: true
  belongs_to :teacher


end
