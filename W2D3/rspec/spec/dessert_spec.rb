require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "steven") }
  subject(:dessert) { Dessert.new("cake", 15, chef) }

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do 
      expect(dessert.quantity).to eq(15)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cake", "15", chef)}.to raise_error(ArgumentError) 
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("potato")
      expect(dessert.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ("a".."z").to_a
      ingredients.each { |ingredient| dessert.add_ingredient(ingredient) }
      dessert.mix!
      expect(ingredients).to_not eq(dessert.ingredients)  
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(10)
      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{(dessert.eat(20))}.to raise_error(RuntimeError)
    end
  end

  # This one should be allow -> receive -> return, then expect
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      dessert.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
