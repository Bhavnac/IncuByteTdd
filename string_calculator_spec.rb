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
  end
end
