class Profile < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :role_id, :user_id, :user, :role

  belongs_to :user
  belongs_to :role

  validates :email,       :presence => true, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :first_name,  :presence => true
  validates :last_name,   :presence => true

  def long_title
    "#{first_name} #{last_name}"
  end
end
