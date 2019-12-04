module Likable
  extend ActiveSupport::Concern

  def liked_by!(user)
    Like.create!(
      user_id: user.id,
      like_type: like_enum,
      type_id: id
    )

    # increment_counter(:like_count, id, touch: true)
    self.like_count += 1
    save!
  end

  def unliked_by!(user)
    Like.find_by(
      user_id: user.id,
      like_type: like_enum,
      type_id: id
    ).destroy!

    # decrement_counter(:like_count, id, touch: true)
    self.like_count -= 1
    save!
  end

  # module ClassMethods
  # end

  # included do
  #   # stuff
  # end

  private

  def like_enum
    Like.like_types[self.class.name.downcase]
  end
end
