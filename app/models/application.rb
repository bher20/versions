class Application < ActiveRecord::Base
  attr_accessible :comment, :guid, :name

  has_many :versions, :order => 'version DESC'
  has_one :user

  validates :name, :presence => true
  validates :guid, :presence => true

  def long_title
    "#{name}"
  end
end
