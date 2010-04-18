# Trie House

This is a trie data structure implemented in ruby. The goal for the project was purely academic. However, I am thinking that something like this might be useful for an auto-complete plugin.

I would like to see if there is a way to bypass AR for auto-complete queries. Ideally, i would have the data returned from the query populated into the trie.

<pre>
trie = Trie.new
trie << "pie" << "apple" << "baseball"
trie.has_word?("p") #=> true
trie.has_word?("pi") #=> true
trie.has_word?("pie") #=> true
trie.each { |word| puts word.key }
</pre>
