class InversionsCount

	@@inversions = 0

  def self.parse_file
    arr = []
    File.open('IntegerArray.txt', 'r') do |f|
      while line = f.gets
        arr << line.strip.to_i
      end
      puts "Sorting list with #{arr.size} items"
    end
    arr
  end

  def self.mergesort(arr)
    return arr if arr.length <= 1
    middle = arr.size / 2
    left = arr[0, middle]
    right = arr[middle, arr.size - middle]
    merge(mergesort(left), mergesort(right))
  end

  def self.merge(left, right)
  	sorted_arr = Array.new
  	until left.empty? || right.empty?
  		c << (left.first <= right.first) ? left.shift : right.shift
  	end
  	sorted_arr + left + right
  end


end

arr = InversionsCount.parse_file
