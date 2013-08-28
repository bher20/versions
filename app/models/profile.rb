class Profile < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :role_id, :user_id

  belongs_to :user
  has_one :role

  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_id, :presence => true
  validates :role_id, :presence => true

  def long_title
    "#{first_name} #{last_name}"
  end
end
