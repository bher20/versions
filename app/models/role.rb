class Role < ActiveRecord::Base
  attr_accessible :comment, :name

  validates :name, :presence => true, :uniqueness => true

  def long_title
    "#{name}"
  end
end
