class Role < ActiveRecord::Base
  attr_accessible :comment, :name, :admin_role

  has_and_belongs_to_many :profiles

  validates :name, :presence => true, :uniqueness => true

  def long_title
    "#{name}"
  end
end
