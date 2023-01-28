require_relative "post"
require "csv"

class PostRepository
  def initialize(csv_filepath)
    @posts = []
    @csv_filepath = csv_filepath
    CSV.foreach(@csv_filepath, encoding: 'ISO-8859-1') do |row|
      @posts << Post.new(row[0], row[3])
    end
  end

  def add(post)
    @posts << post
    CSV.open(@csv_filepath, "a+") { |csv| csv << [post.link, post.content, post.author, post.read] }
  end

  def mark_post_as_read(post)
    post.mark_as_read!
    update_db
  end

  def all
    @posts
  end

  def find(index)
    return @posts[index]
  end

  def update_db
    # write the updated rows back to the CSV file
    CSV.open(@csv_filepath, "w") do |csv|
      @posts.each { |post| csv << [post.link, post.content, post.author, post.read] }
    end
  end
end
