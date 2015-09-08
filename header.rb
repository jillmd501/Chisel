class Header
  def initialize(paragraph)
    @string = paragraph
  end
  def parse_header
    number = @string.count("#")
    string = @string.gsub("# ", "").gsub("#", "").lstrip
    "<h#{number}>#{string}</h#{number}>"
  end
end
