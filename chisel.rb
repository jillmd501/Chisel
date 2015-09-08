require_relative 'header'
require_relative 'paragraph'
require_relative 'highlights'
class Chisel
  def initialize(string)
    @string = string
  end

  def parse
    markdown_chunks = @string.split("\n\n")
    html_chunks = markdown_chunks.map do |paragraph|
      if paragraph.include?("#")
        header = Header.new(paragraph)
        header.parse_header
        # if paragraph.include?("*")
        #   paragraph = Highlights.new(paragraph)
        #   paragraph.parse_bold_or_italics
        # end
      else
        paragraph = Paragraph.new(paragraph)
        paragraph.parse_paragraph
      end
    end
    html_chunks.join
  end
end
