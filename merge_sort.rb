# Steps to merge-sort:
# 1. Split array into two 'halves'
# 2. Split left array into two 'halves' and etc.
# 3. Once arrays are split into just one element, these 1-element arrays are sorted by default
# 4. Compare which of the 1-element should be first
# 5. Compare 

def merge_sort(array)
  # arrays of length one are already sorted
  return array if array.length == 1

  # 1. getting the half index
  half = (array.length - 1) / 2
  # splitting the array into two
  left = merge_sort(array[0..half])
  right = merge_sort(array[half + 1..-1])

  # merging the two sorted halves
  merge(left, right)
end

def merge(left, right)
  merged_array = []
  merged_array << right.first < left.first ? right.shift : left.shift until left.empty? || right.empty?

  return merged_array.push(left).flatten if right.empty?
  return merged_array.push(right).flatten if left.empty?
end

p merge_sort([3, 4, 2, 1, 5, 0, 10, 9, 7, 8, 6])
