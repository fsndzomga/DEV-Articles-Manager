require_relative "view"
require_relative "post"

class Controller
  def initialize(post_repository)
    @post_repository = post_repository
    @view = View.new
  end

  def list
    @view.list_all_posts(@post_repository.all)
  end

  def save
    @post_repository.add(Post.new(@view.add_post))
  end

  def read
    @post_repository.find(@view.read_post).read_article!
    @post_repository.update_db
  end

  def mark
    @post_repository.find(@view.mark_post_as_read).mark_as_read!
    @post_repository.update_db
  end
end
