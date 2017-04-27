class Test < ActiveRecord::Base
  has_many :songs_tests, dependent: :destroy
  has_many :songs, through: :songs_tests
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  enum genre: [:pop, :hiphop, :country, :edm, :folk, :rb, :rock] 
end
