require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'adding to the trie' do

  it "should result in the trie having three nodes" do
    @trie = Trie.new
    @trie << 'pie'
    @trie.size.should eql( 3 )
  end

  it "should use effecient storage" do
    @trie = Trie.new << "one" << "onto"
    @trie.size.should eql( 5 )
  end

  it "should return slef to chain additions" do
    Trie.new << "one" << "two" << "three"
  end

  it "should yield a block to print out letters" do
    @trie = Trie.new
    @trie << 'one'
    results = ''
    @trie.each {|n| results << n.key }
    results.reverse.should eql('one')
  end

end

describe "suggesting a word" do
  it "should return an array of suggestions" do
    @trie = Trie.new
    @trie << 'one'
    @trie.suggests('o').should eql(['one'])
  end

  it "should return an array of suggestions" do
    @trie = Trie.new
    @trie << 'one' << 'only'
    @trie.suggests('o').should eql(['one','only'])
  end
end
