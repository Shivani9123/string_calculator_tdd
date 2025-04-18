class StringCalculator
  # Main method to add numbers from a given string
  def self.add(numbers)
    # Return 0 if the input string is empty
    return 0 if numbers.empty?

    # Default delimiters are comma and newline
    delimiter = /,|\n/

    # Check if the input starts with custom delimiter definition (e.g., "//;\n1;2")
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2) # Split into delimiter definition and actual numbers
      custom_delimiter = parts[0][2] # Extract the delimiter character (after "//")
      delimiter = Regexp.union(custom_delimiter) # Create a regex for the custom delimiter
      numbers = parts[1] # Update numbers to exclude delimiter definition
    end

    # Split the numbers string using the delimiter(s) and convert them to integers
    nums = numbers.split(delimiter).map(&:to_i)

    # Check for negative numbers and raise an error if found
    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    # Return the sum of the numbers
    nums.sum
  end
end
