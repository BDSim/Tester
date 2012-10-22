#Pig latin translator 
module PigLatin #only one word at a time (convert to array)
  def self.translator(a)
    b = a.chars.to_a
    b.collect do |c| #Vowels
      if c.start_with?("a", "e", "i", "o", "u")
        b.push("a", "y")
        q = b.join("")
        return q  #terminates loop
      else
        f = []
        j = []
        a.chars.to_a.collect do |c| #Consonants
          if c.start_with?("b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
                           "p", "q", "r", "s", "t", "v", "w", "x", "y", "z")
            f.push(c)
          else
            g = f.count             #
            h = b.slice(g..-1)      #
            j << h << f << %w[a y] 
            t = j.join("")          #
            return t   #terminates loop 
          end
        end
      end 
    end
  end
end
#Translator frontend
class Translator
  def self.pig(a)
    x = []
    b = a.downcase.lstrip.rstrip.split(" ")
    b.collect do |c|
      x << PigLatin.translator(c) 
    end
    return x.join(" ").capitalize
  end
end

require "~/Ruby/performance_monitor.rb"
p "Pig Latin Translator"
print "Enter English Word(s): "
puts performance{p Translator.pig(gets)}

