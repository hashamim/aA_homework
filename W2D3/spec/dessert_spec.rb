require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) {Dessert.new("cake", 10, chef)}
  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(cake.quantity).to be(10)
    end
    it "starts ingredients as an empty array" do
      expect(cake.ingredients.empty?).to be(true)
    end
    it "raises an argument error when given a non-integer quantity" do
    expect{Dessert.new("brownie","noninteger",chef)}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("ketchup")
      expect(cake.ingredients).to include("ketchup") 
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient("durian")
      cake.add_ingredient("chicken")
      cake.add_ingredient("cake")
      cake.add_ingredient("lies")
      cake.mix!
      expect(cake.ingredients).to_not eq(["durian","chicken","cake","lies"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(3)
      expect(cake.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cake.eat(11)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      cake.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
