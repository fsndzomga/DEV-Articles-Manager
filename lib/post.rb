require "open-uri"
require "nokogiri"


class Post
  attr_reader :title, :author, :link, :read, :content

  USER_AGENT = "Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0"

  def initialize(link, read = false)
    @link = link
    @url = "https://dev.to/#{link}"
    @read = read

    html_content = URI.open(@url, "User-Agent" => USER_AGENT).read
    doc = Nokogiri::HTML.parse(html_content)
    i = 0
    doc.search("h1").each do |element|
      @title = element.text.strip if i.zero?
      i += 1
    end

    doc.search(".crayons-link.fw-bold").each do |element|
      @author = element.text.strip
    end

    @content = ""
    p_elements = Nokogiri::HTML(html_content).at_css("#article-body").search("p")
    p_elements.each do |p_element|
      # Remove any HTML or XML tags using a regular expression
      cleaned_text = p_element.text.gsub(/<\/?[^>]+>/, '')
      # Print the cleaned text
      @content += "#{cleaned_text}\n"
    end
  end

  def mark_as_read!
    @read = true
  end

  def read_article!
    URI.open(@url, "User-Agent" => USER_AGENT)
    mark_as_read!
  end
end
