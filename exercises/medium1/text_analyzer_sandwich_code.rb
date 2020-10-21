class TextAnalyzer
  def process
    file = File.read('sample.txt')
    counter = 0

    yield(file)

    # File.foreach('sample.txt') do |line|
    #   counter += yield(line)
    # end

    # counter
  end
end

analyzer = TextAnalyzer.new
# paragraphs
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# lines
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# words
analyzer.process { |text| puts "#{text.split(' ').size} words" }
