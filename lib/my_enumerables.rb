module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    length.times do |index|
      yield(self[index])
    end

    self
  end
end

module Enumerable
  def my_each_with_index
    length.times do |index|
      yield(self[index], index)
    end

    self
  end

  def my_select
    matches = []

    my_each do |elem|
      matches << elem if yield(elem)
    end

    matches
  end

  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end

    true
  end

  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end

    false
  end

  def my_none?
    my_each do |elem|
      return false if yield(elem)
    end

    true
  end

  def my_count
    return length unless block_given?

    count = 0

    my_each do |elem|
      count += 1 if yield(elem)
    end

    count
  end

  def my_map
    result = []

    my_each do |elem|
      result << yield(elem)
    end

    result
  end

  def my_inject(accumulator = nil)
    my_each do |elem|
      accumulator = yield(accumulator, elem)
    end

    accumulator
  end
end
