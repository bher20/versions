class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  before_save :setup_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable,
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :role_ids
  attr_accessor :login

  validates :username,
            :uniqueness => {
                :case_sensitive => false
            }

  #Allow both email and username authentication
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def role?(role)
    !!self.roles.find_by_name(role.to_s.camelize)
  end

  def admin?
    !!self.roles.find_by_name(:admin)
  end

  # Default role is "Registered"
  def setup_role
    if self.role_ids.empty?
      self.role_ids = self.roles.find_by_name(:registered).id
    end
  end
end
