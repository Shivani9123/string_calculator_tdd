require './string_calculator'

RSpec.describe StringCalculator do

  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself when a single number is provided' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum of two comma-separated numbers' do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it 'returns the sum of multiple comma-separated numbers' do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters specified in the format //delimiter\\n' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
  end
end
