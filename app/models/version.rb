class Version < ActiveRecord::Base
  attr_accessible :application_id, :change_log, :number, :comment, :application, :url

  belongs_to :application

  validates :number, :presence => true

  serialize :change_log

  before_create :parse_change_log
  before_save :number_to_s
  after_find :parse_number, :parse_change_log


  def number_to_s
    self.number = self.number.to_s
  end

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

    def to_render_hash
      tmp_version = {
        :change_log => self.change_log,
        :number => self.number.to_s,
        :created => self.created_at,
        :url => self.url,
      }

      return tmp_version
    end
end
