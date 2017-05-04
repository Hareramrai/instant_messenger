module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def gravatar_image_for user
    gravatar_image_tag user.username.gsub('spam', 'mdeering'), alt: user.username
  end
end
