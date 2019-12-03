class Spiciest < ApplicationRecord
  scope :paginate, ->(per_page, page_num) { limit(per_page).offset((page_num - 1) * per_page) }
end
