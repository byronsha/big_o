# factorial: permutation is O(n!)
def first_anagram?(string1, string2)
  string1.split('').permutation.include?(string2.split(''))
end

# quadratic: O(n^2)
def second_anagram2?(string1, string2)
  string1.each_char do |char|
    if string2.include?(char)
      string2.slice!(string2.index(char))
      string1.slice!(char)
    end
  end
  [string1, string2].all?(&:empty?)
end

# logarithmic ? : O(n*log(n))
def third_anagram?(string1, string2)
  string1.split("").sort == string2.split("").sort
end

# linear: O(n)
def fourth_anagram?(string1, string2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  string1.each_char do |char|
    str1_hash[char] += 1
  end

  string2.each_char do |char|
    str2_hash[char] += 1
  end
  str1_hash == str2_hash
  # str1_hash.each do |k, v|
  #   return false unless str2_hash[k] == v
  # end
  # true
end

# linear: O(n)
def fifth_anagram?(string1, string2)
  counts_hash = Hash.new(0)

  string1.each_char do |char|
    counts_hash[char] += 1
  end

  string2.each_char do |char|
    counts_hash[char] -= 1
  end
  counts_hash.values.all? { |value| value == 0 }
end

p second_anagram2?("gizmo", "sally")
p second_anagram2?("elvis", "lives")
