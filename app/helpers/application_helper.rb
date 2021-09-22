module ApplicationHelper
  def show_flashes(flash)
    return_html = ''
    flash.each do |message_type, message|
      return_html += tag.div(message, class: "alert alert-#{message_type}")
    end
    return_html.html_safe
  end
end
