class View
  def list_all_posts(posts)
    posts.each_with_index do |post, index|
      status = post.read == "true" ? "[x]" : "[]"
      puts "#{index + 1}. #{status} - #{post.title} (#{post.author})"
      puts "---------------------------------------------------------"
    end
  end

  def add_post
    puts "Enter the link of the article:"
    print ">"
    return gets.chomp
  end

  def read_post
    puts "Enter the index of the post you want to read"
    print ">"
    return gets.chomp.to_i - 1
  end

  def mark_post_as_read
    puts "Enter the index of the post you read"
    print ">"
    return gets.chomp.to_i - 1
  end
end
