module ShoutHelper
  def avatar(user)
    image_tag "//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}"
  end

  def like_button(shout)
    if current_user.liked?(shout)
      link_to 'Unlike', unlike_shout_path(shout), method: :delete
    else
      link_to 'Like', like_shout_path(shout), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1]) }.html_safe
  end
end
