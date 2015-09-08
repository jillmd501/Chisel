class Paragraph
  def initialize(paragraph)
    @string = paragraph
  end
  def parse_paragraph
    "<p>#{@string}</p>"
  end
end
