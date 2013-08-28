module VersionsHelper
  def change_log_to_html (version)
    version_string = '<ul>'

    version.change_log.each do |c|
      version_string = "#{version_string}<li>#{c}</li>"
    end
    version_string = "#{version_string}</ul>"

    return version_string.html_safe
  end
end
