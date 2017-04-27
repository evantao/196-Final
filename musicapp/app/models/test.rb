class Test < ActiveRecord::Base
  has_many :albums_tests, dependent: :destroy
  has_many :albums, through: :albums_tests
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  
end
