module LikesHelper
  def like_src(post, user)
    post.likes.each do |like|
      return 'assets/red-like.png' if like.liked_by(user)
    end
    'assets/empty-like.png'
  end
end
