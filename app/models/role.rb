class Role < ActiveRecord::Base
  attr_accessible :comment, :name

  has_many :profiles

  validates :name, :presence => true

  def long_title
    "#{name}"
  end
end
