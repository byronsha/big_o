require 'byebug'
# quadratic: O(n^2)
def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

# O(n*log(n)), sorting array (w/out sort, maybe log, maybe linear)
def okay_two_sum?(arr, target_sum)
  arr.sort!

  small_i = 0
  large_i = arr.size - 1
  until small_i == large_i
    check_sum = arr[small_i] + arr[large_i]
    if check_sum == target_sum
      return true
    elsif check_sum < target_sum
      small_i += 1
    elsif check_sum > target_sum
      large_i -= 1
    end
  end
  false
end

#linear
def hash_two_sum?(arr, target_sum)
  arr_hash = Hash.new(0)
  arr.each do |el|
    arr_hash[el] += 1
  end
  return true if arr_hash[target_sum/2] >= 2
  (0...target_sum/2).each do |num|
    return true if arr_hash[num] >= 1 && arr_hash[target_sum - num] >= 1
  end
  false
end

def hash_two_sum_redux?(arr, target_sum)
  arr_hash = Hash.new(0)
  arr.each do |el|
    arr_hash[el] += 1
  end
  arr.each do |num|
    if num == target_sum/2
      next unless arr_hash[num] >= 2
    end
    return true if arr_hash[target_sum - num] >= 1
  end
  false
end

def three_sum?(arr, target_sum)
  arr_hash = Hash.new(0)
  arr.each do |el|
    arr_hash[el] += 1
  end

  arr.each_with_index do |num, idx|
    if arr_hash[num] >= 1 && hash_two_sum_redux?(arr.reject { |el| arr.index(el) == idx }, target_sum - num)
      return true
    end
  end
  false
end

def four_sum?(arr, target_sum)
  arr_hash = Hash.new(0)
  arr.each do |el|
    arr_hash[el] += 1
  end

  arr.each_with_index do |num, idx|
    if arr_hash[num] >= 1 && three_sum?(arr.reject { |el| arr.index(el) == idx }, target_sum - num)
      return true
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p hash_two_sum_redux?(arr, 6) # => should be true
# p hash_two_sum_redux?(arr, 10) # => should be false

arr = [2,3,4,5,6,7,-8,-10]

# p three_sum?(arr, 9) # true
# p three_sum?(arr, 40) # false
# p three_sum?(arr, -11) # true

p four_sum?(arr, 19) # => should be true
p four_sum?(arr, 40) # => should be false
p four_sum?([-10,-10,-15,-])
