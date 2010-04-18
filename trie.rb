class Node
  attr_accessor :key, :value, :children
  def initialize(first_char=nil)
    @value    = 0
    @key      = first_char
    @children = []
  end
end

class Trie

  def initialize
    @root = Node.new
  end

  def <<(word)
    add( @root.children, word)  
  end

  def include?(word)
    has?( @root.children, word ) 
  end

  def size
    sum = 0
    walk( @root ) {|i| sum += 1 }
    sum
  end

  def each(&block)
    walk(@root,&block)
  end

  private 

    def add(row, word)
      return self if word.empty?
      first_char = word[0..0]
      last_chars = word[1..-1]
      node = row.select { |node| node.key == first_char}[0]
      if node.nil?
        row << new_node = Node.new(first_char)
        add(new_node.children, last_chars)
      else
        add(node.children, last_chars)
      end
    end

    def has?(row,word)
      return true if row.length.zero? or word.length.zero?
      node = row.select { |node| node.key == word[0..0]}[0]
      return false if node.nil?
      has?(node.children, word[1..-1])
    end

    def walk(node,&block)
      unless node.children.empty?
        node.children.each { |child| walk(child,&block) }
      end
      yield node unless node == @root
    end

end
