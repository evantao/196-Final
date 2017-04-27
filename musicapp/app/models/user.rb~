class User < ActiveRecord::Base
  include BCrypt
  
  has_many :tests, dependent: :destroy
  validates :name, presence: true
  validates :password, presence: true
  validate :cap_name

  def cap_name
    unless name.nil? || name.empty? || name[0].capitalize == name[0]
      errors.add(:name, 'is not capitalized')
    end
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
