def alphabet?(char)
  lowercase?(char) || uppercase?(char)
end

def lowercase?(char)
  (97..122).cover?(char.ord)
end

def uppercase?(char)
  (65..90).cover?(char.ord)
end

def rot13(filename)
  File.foreach(filename) do |string|
    result = []
    string.each_char do |char|
      if alphabet?(char)
        new_ord = char.ord + 13
        new_char = 
          if lowercase?(char)
            lowercase?(new_ord.chr) ? new_ord.chr : (char.ord - 13).chr
          elsif uppercase?(char)
            uppercase?(new_ord.chr) ? new_ord.chr : (char.ord - 13).chr
          end

        result << new_char
      else
        result << char
      end
    end
    puts result.join('')
  end
end

rot13("rot13_names.txt")