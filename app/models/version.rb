class Version < ActiveRecord::Base
  attr_accessible :application_id, :change_log, :version, :comment

  belongs_to :application

  validates :application_id, :presence => true
  validates :version, :presence => true

  def long_title
    "#{version}"
  end
end
