module VersionsHelper
  def change_log_to_html (version)
    version_string = '<span class="change_logs"><ul>'

    version.change_log.each do |c|
      version_string = "#{version_string}<li>#{c}</li>"
    end
    version_string = "#{version_string}</ul></span>"

    return version_string.html_safe
  end
end
