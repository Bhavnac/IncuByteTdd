require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "when input is empty" do
      it "returns zero" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "when input has one number" do
      it "returns the number itself" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end
    
    context "when input has two numbers" do
      it "returns their sum" do
        expect(StringCalculator.add("1,2")).to eq(3)
      end
    end

    context "when input includes new lines between numbers" do
      it "returns their sum" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end
    
    context "when input includes custom delimiter" do
      it "returns their sum using the custom delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context "when input includes negative numbers" do
      it "raises an exception for negative numbers" do
        expect { StringCalculator.add("1,-2,3,-4") }.to raise_error(RuntimeError, "negative numbers not allowed: -2, -4")
      end
    end

    context "with malformed strings" do
      it "should ignore invalid parts" do
        expect { StringCalculator.add("1,\n") }.to raise_error(RuntimeError)
      end
    end
  end
end
