require_relative 'chisel'

class File_io
  def initialize(markdown, html)
    @markdown = File.open(ARGV[0], "r").read
    @html = File.open(ARGV[1],'w')
  end

  def run_parser
    chisel = Chisel.new(@markdown)
    @final_text = chisel.parse
  end

  def write_to_html
    @html.write(@final_text)
  end
end

file = File_io.new(ARGV[0], ARGV[1])
file.run_parser
file.write_to_html
