module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a? GuestUser
      (link_to "register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "sign in", new_user_session_path, class: style)
    else
      link_to "logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for heading over from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")      
    end
  end

  def set_copyright
    VerasViewTool::Renderer.copyright 'Kaifu Tri Team e. V.', 'Do what you love. Together.'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
            {
        url: about_me_path,
        title: 'Über uns'
      },
            {
        url: contact_path,
        title: 'Kontakt'
      },
            {
        url: blogs_path,
        title: 'News'
      },
            {
        url: portfolios_path,
        title: 'Teams'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
