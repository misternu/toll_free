require_relative 'spec_helper'
require_relative '../permutations'

describe "#permutations" do
  it 'returns the permutations of the arrays given to it' do
    expect(permutations([[1,2], [3,4]])).to match_array [[1,3], [1,4], [2,3], [2,4]]
  end
end

describe "splits" do
  it 'returns the different cuts that can be made of a string' do
    expect(splits("abc")).to match_array [["abc"], ["a","bc"], ["ab","c"], ["a","b","c"]]
  end
end
