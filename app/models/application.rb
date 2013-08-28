class Application < ActiveRecord::Base
  attr_accessible :comment, :guid, :name, :user, :user_id

  has_many :versions, :order => 'number DESC'
  belongs_to :user

  validates :name, :presence => true

  before_save :generate_guid

  def long_title
    "#{name}"
  end

  def generate_guid
    self.guid ||= UUIDTools::UUID.random_create.to_s
  end
end
