class MyStack
  def initialize
    @store = []
  end

  def pop
    el = @store.pop
    el[:el]
  end

  def push(el)
    element = Hash.new
    element[:el] = el
    if @store.empty?
      element[:max] = el
      element[:min] = el
    else
      element[:max] = [el, @store.last[:max]].max
      element[:min] = [el, @store.last[:min]].min
    end
    @store.push(element)
  end

  def peek
    return nil if @store.empty?
    @store.last[:el]
  end

  def max
    return nil if @store.empty?
    @store.last[:max]
  end

  def min
    return nil if @store.empty?
    @store.last[:min]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @input = MyStack.new
    @output = MyStack.new
  end

  def enqueue(el)
    @input.push(el)
  end

  def dequeue
    if @output.empty?
      until @input.empty?
        @output.push(@input.pop)
      end
    end
    @output.pop
  end

  def max
    arr = []
    arr << @input.max unless @input.max.nil?
    arr << @output.max unless @output.max.nil?
    arr.max
  end

  def min
    arr = []
    arr << @input.min unless @input.min.nil?
    arr << @output.min unless @output.min.nil?
    arr.min
  end

  def size
    @input.size + @output.size
  end

  def empty?
    @input.empty? && @output.empty?
  end
end

a = MyStack.new
