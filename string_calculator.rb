class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      custom_delimiter = parts[0][2]
      delimiter = Regexp.union(custom_delimiter)
      numbers = parts[1]
    end

    numbers.split(delimiter).map(&:to_i).sum
  end
end
