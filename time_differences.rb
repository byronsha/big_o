# quadratic: O(2n*n + 2) => O(n^2)
def my_min(list)
  return list.first if list.uniq.size < 2
  return nil if list.empty?
  list.each do |num|
    new_list = list.reject { |n| n == num }
    return num if new_list.all? { |el| el > num }
  end
end

# linear: O(n + 2) => O(n)
def my_min_iter(list)
  minimum = nil
  list.each do |num|
    if minimum.nil? || num < minimum
      minimum = num
    end
  end
  minimum
end

# quadratic: O(n^2 + 3n + 1) => O(n^2)
def largest_contiguous_subsum(list)
  subs = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      subs << list[i..j]
    end
  end
  subs.map! do |sub|
    sub.inject(&:+)
  end
  subs.max
end

# linear: O(4n + 4) => O(n)
def largest_contiguous_subsum2(list)
  max_so_far = nil
  max_ending_here = list[0]

  list.each do |num|
    max_ending_here =
    if max_so_far.nil? || max_ending_here > max_so_far
      max_ending_here =
  #
  # return nil if list.empty?
  # current_sum = list.shift
  # largest_sum = current_sum
  #
  # list.each do |num|
  #   if num < 0
  #     current_sum = num
  #   else
  #     current_sum += num
  #   end
  #   if num > largest_sum
  #     largest_sum = num
  #   elsif current_sum > largest_sum
  #     largest_sum = current_sum
  #   end
  #   # sum = current_sum + num
  #   # if num > largest_sum
  #   #   largest_sum = num
  #   # elsif sum > largest_sum
  #   #   largest_sum = sum
  #   # end
  #   # if sum < current_sum
  #   #   current_sum = num
  #   # end
  # end
  # largest_sum
end

KIDANE

list = [1, 9, 3, -7, 20, -20, 23]
p largest_contiguous_subsum2(list)
