class MergeSort
	def self.mergesort(arr)
		return arr if arr.length <= 1
		middle = arr.length / 2
		left = arr[0, middle]
		right = arr[middle, arr.size - middle]
		merge(mergesort(left), mergesort(right))
	end

	private 
		def self.merge(left, right)
			sorted_arr = Array.new
			until (left.empty? || right.empty?)
				sorted_arr << (left.first <= right.first ? left.shift : right.shift)
			end
			sorted_arr + left + right
		end

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
end

class InversionsCount < MergeSort
	def self.count_inversions(arr)
		@number_of_inversions = 0
		mergesort(arr)
		puts "There are #{@number_of_inversions} inversions."
		@number_of_inversions
	end
	
	private 
		def self.merge(left, right)
			sorted_arr = Array.new
			until left.empty? || right.empty?
				if left.first <= right.first
					sorted_arr << left.shift
				else
					sorted_arr << right.shift
					@number_of_inversions += left.length
				end
			end
			sorted_arr + left + right
		end
end

arr = InversionsCount.parse_file
InversionsCount.count_inversions(arr) # => 2407905288
# p sorted_arr = MergeSort.mergesort(arr)
