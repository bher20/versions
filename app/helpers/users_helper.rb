module UsersHelper
  def roles_to_html (roles)
    roles_string = '<span class="attribute_list"><ul>'

    roles.each do |r|
      roles_string = "#{roles_string}<li>#{r.name}</li>"
    end

    "#{roles_string}</ul></span>".html_safe
  end
end
