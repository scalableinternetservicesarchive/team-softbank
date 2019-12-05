module ApplicationHelper
  def cache_key_for_header(current_user)
    "header-#{current_user&.id}"
  end
end
