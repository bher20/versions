class Application < ActiveRecord::Base
  attr_accessible :comment, :guid, :name, :user, :user_id

  has_many :versions, :order => 'number DESC'
  belongs_to :user

  validates :name, :presence => true

  before_save :generate_guid

  def long_title
    "#{name}"
  end

  def to_param  # overridden
    guid
  end

  def generate_guid
    if self.guid == nil
      self.guid ||= UUIDTools::UUID.random_create.to_s
    end
  end
end
