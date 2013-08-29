require 'digest'

class User < ActiveRecord::Base
  attr_accessible :name, :password, :profile_attributes
  attr_accessor :password

  has_one :profile

  accepts_nested_attributes_for :profile

  validates :name, :presence => true
  validates :password, :confirmation => true,
            :length => { :minimum => 8 },
            :presence => true,
            :if => :password_required?

  before_save :encrypt_new_password

  def self.authenticate(name, password)
    user = find_by_name(name)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

  def long_title
    "#{name}"
  end
end
