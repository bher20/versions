class Version < ActiveRecord::Base
  attr_accessible :application_id, :change_log, :number, :comment, :application

  belongs_to :application

  validates :number, :presence => true

  serialize :change_log

  before_create :parse_change_log
  after_find :parse_number, :parse_change_log

  def parse_number
    if self.number.class != Versionomy
      self.number = Versionomy.parse(self.number)
    end
  end

  def parse_change_log
    if self.change_log.class != Array
      self.change_log = self.change_log.lines.map(&:chomp)
    end
  end

  def long_title
    "#{version}"
  end

  public
    def is_newer?(version)
      if self.number > version
        true
      else
        false
      end
    end
end
