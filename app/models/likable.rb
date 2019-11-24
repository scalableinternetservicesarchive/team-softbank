module Likable
  def liked_by!(user)
    Like.create!(
      user_id: user.id,
      like_type: like_enum,
      type_id: id
    )

    increment!(:like_count)
  end

  def unliked_by!(user)
    Like.find_by(
      user_id: user.id,
      like_type: like_enum,
      type_id: id
    ).destroy!

    decrement!(:like_count)
  end

  # module ClassMethods
  # end

  # def self.included(including_class)
  #   including_class.extend ClassMethods
  # end

  private

  def like_enum
    Like.like_types[self.class.name.downcase]
  end
end
