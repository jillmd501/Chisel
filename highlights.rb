class Highlight
  def initialize (paragraph)
    @string = paragraph
  end

  def parse_bold_or_italics
    if @string.include?("**")
      @string.parse_bold
    else
      @string.parse_italics
    end
  end

  def parse_italics
    string = @string.gsub("*", "").lstrip
    "<em>#{string}</em>"
  end

  def parse_bold
    string = @string.gsub("**", "").lstrip
    "<strong>#{string}</strong>"
  end
end
