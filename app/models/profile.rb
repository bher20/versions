class Profile < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :user_id, :user

  belongs_to :user
  has_and_belongs_to_many :roles

  validates :email,       :presence => true, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  def long_title
    "#{first_name} #{last_name}"
  end
end
