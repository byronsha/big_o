require 'byebug'

def max_subarray(array)
  debugger
  highest_sum_so_far = -1.0 / 0
  highest_with_current = -1.0 / 0

  array.each do |current_number|
    highest_with_current = [current_number, highest_with_current + current_number].max
    highest_sum_so_far = [highest_sum_so_far, highest_with_current].max
  end

  highest_sum_so_far
end

max_subarray([1,2,3,-6,1,2,3,1])
