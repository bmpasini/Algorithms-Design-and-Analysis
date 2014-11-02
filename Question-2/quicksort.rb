def partition_array(array, left, right, pivot_index)
  pivot_value = array[pivot_index]
  array[pivot_index], array[right] = array[right], array[pivot_index]
  store_index = left

  (left..right-1).each do |i|
    if array[i] < pivot_value
      array[i], array[store_index] = array[store_index], array[i]
      store_index = store_index + 1
    end
  end

  array[store_index], array[right] = array[right], array[store_index]
  return store_index
end

def inplace_quicksort(array, left, right)
  if left < right
    pivot_index = (left + ((right - left) / 2)).to_i
    new_pivot_index = partition_array(array, left, right, pivot_index)
    inplace_quicksort(array, left, new_pivot_index - 1)
    inplace_quicksort(array, new_pivot_index + 1, right)
  end

  return array
end

names = File.readlines("QuickSort.txt")
sorted_names = inplace_quicksort(names, 0, names.length - 1)
puts sorted_names