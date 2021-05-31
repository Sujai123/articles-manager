module ApplicationHelper

  def robo_image_url(user, size)
    "https://robohash.org/#{user.username}?size=#{size}x#{size}"
  end

  def get_robo_image_for(user, options = {size: 200})
    size = options[:size]
    image_tag(robo_image_url(user, size), alt: user.username, class: "rounded mx-auto d-block")
  end
end
