require_relative "minmaxstackqueue"

# linear or quadratic?
def naive_max_window(arr, window_size)
  current_max_range = nil
  (0..arr.length - window_size).each do |idx|
    window = arr[idx, window_size]
    window_diff = window.max - window.min
    if current_max_range.nil? || window_diff > current_max_range
      current_max_range = window_diff
    end
  end
  current_max_range
end

def max_window(arr, window_size)
  current_max_range = -1.0/0
  window = StackQueue.new

  until window.size == window_size
    window.enqueue(arr.shift)
  end

  while window.size == window_size
    window_diff = window.max - window.min
    if window_diff > current_max_range
      current_max_range = window_diff
    end
    window.dequeue
    window.enqueue(arr.shift) unless arr.empty?
  end
  current_max_range
end

p max_window([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p max_window([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p max_window([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p max_window([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
