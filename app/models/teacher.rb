class Teacher < ApplicationRecord
  searchkick locations: ["location"]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos

  has_many :reservations

  has_many :subjects
  has_many :timeslots
  has_many :users, through: :timeslots
  after_save :reindex_item


  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	# validates :education, presence: true
  # validates :biography, presence: true, length: {maximum: 500}
  # validates :teaching_statement, presence: true, length: {maximum: 100}
  # validates :address, presence: true
  # validates :ages_taught, presence: true
  # validates :levels_taught, presence: true
  # validates :languages, presence: true
  # validates :lesson_locations, presence: true
  # validates :hourly_rate, presence: true, numericality: true

  def reindex_item
    reindex
  end

  def search_data
    attributes.merge(
      location: [latitude, longitude],
      subjects: subjects.map(&:title),
      levels: subjects.map(&:level)
    )
  end
end
