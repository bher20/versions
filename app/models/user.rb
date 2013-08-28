class User < ActiveRecord::Base
  attr_accessible :name, :password

  has_one :profile

  validates :name, :presence => true
  validates :password, :presence => true

  def long_title
    "#{name}"
  end
end
