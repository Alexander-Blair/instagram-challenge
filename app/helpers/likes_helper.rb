module LikesHelper
  def like_src(post, user)
    return "assets/empty-like.png" unless liked_post(post, user)
    "assets/red-like.png"
  end

  def liked_post(post, user)
    post.likes.each do |like|
      return like.id if like.liked_by(user)
    end
    return false
  end

  def like_action(post, user)
    return likes_path unless liked_post(post, user)
    like_path(liked_post(post, user))
  end

  def like_method(post, user)
    return :create unless liked_post(post, user)
    :delete
  end
end
