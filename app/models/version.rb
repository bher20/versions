class Version < ActiveRecord::Base
  attr_accessible :application_id, :change_log, :number, :comment, :application

  belongs_to :application

  validates :number, :presence => true

  serialize :change_log
  serialize :number

  def long_title
    "#{version}"
  end
end
