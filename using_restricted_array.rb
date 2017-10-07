require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# An unused space in the restricted array has the 'SPECIAL_VALUE'
SPECIAL_VALUE = 9999

## Calculates the length of the restricted integer array_size
def length(array)
  i = 0
  while array[i] != nil do
    i += 1
  end
  return i
  # puts "NOT IMPLEMENTED"
end

# Prints each integer values in the array
def print_array(array)
  (length(array)).times do |i|
    print "#{array[i]} "
  end
  puts "---"
  # puts "NOT IMPLEMENTED"
end

# Reverses the values in the integer array
def reverse(array, length) # Ruby
  if length == 1
    return array
  end

  if length == 0
    return array
  end
  i = 0
  j = length - 1
  temp = 0
  until i >= j do
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i += 1
    j -= 1
  end
  return array
  # puts "NOT IMPLEMENTED"
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  length.times do |i|
    if array[i] == value_to_find
      return true
    end
  end
  return false
  # puts "NOT IMPLEMENTED"
end

# Sorts the array in ascending order.
def sort(array, length)
  if length == 1
    return array
  end

  if length == 0
    return array
  end
  # -3 0 7 -4 10

  i = 0
  j = 1

  # 72 128 128 51 3

  # 3 51 128 128 72
            # 4

  # min = 3

  while i < (length - 1) do
    min = array[i]
    while j < length do
      if array[j] < min
        min = array[j]
        min_index = j
        puts "min index: #{min_index}"
      end
      j += 1
    end

    if array[i] <= min
      i += 1
      j = i + 1
    else
      temp = array[i]
      array[i] = min
      puts "array[min_index]: #{array[min_index]}"
      array[min_index] = temp
      i += 1
      j = i + 1
    end
  end
  # puts "NOT IMPLEMENTED"
end

# Restricted arrays cannot be resized. So, we follow a convention.
# Convention: change the value to be deleted with 'SPECIAL_VALUE'
# Deletes 'value_to_delete' if found in the array. To keep the array size
# constant, adds an element with 'SPECIAL_VALUE' in the end. Assumes the array
# to be sorted in ascending order.
def delete(array, length, value_to_delete)
  i = 0
  while i < length do
    if array[i] == value_to_delete
      array[i] = SPECIAL_VALUE
      return array
    end
    i += 1
  end
  # puts "NOT IMPLEMENTED"
end

# Restricted array cannot be resized. So, we workaround by having a convention
# Convention: replace all values with 'SPECIAL_VALUE'
# Empties the restricted array by making all values = SPECIAL_VALUE
def empty(array, length)
  i = 0
  while i < length do
    array[i] = SPECIAL_VALUE
    i += 1
  end
  return array
  # puts "NOT IMPLEMENTED"
end

# Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
# Assumes that the array is not sorted.
def find_largest(array, length)
  sort(array, length)
  return array[length-1]
  # puts "NOT IMPLEMENTED"
end

# Insert value to insert at the correct index into the array assuming the array
# is sorted in ascending manner.
# Restricted arrays cannot be resized. Insert only if there is space in the array.
# (Hint: if there are no elements with 'SPECIAL_VALUE', there is no room to insert)
# All subsequent elements will need to be moved forward by one index.
def insert_ascending(array, length, value_to_insert)
  sort(array, length)
  i = 0
  j = length
  while i < length do
    if value_to_insert < array[i]
      insert_index = i
      until j == i
        array[j] = array[j-1]
        j -= 1
      end
      array[i] = v
    end
  end
  # puts "NOT IMPLEMENTED"
end

## --- END OF METHODS ---

# A restricted array could be constructed of a given size like so
size = 5
my_integer_array = RestrictedArray.new(size)
my_integer_array_length = length(my_integer_array)
# puts "#{my_integer_array}"
puts "The length of my integer array is #{my_integer_array_length}, which should be the same as #{size}."
puts "BUG!" if my_integer_array_length != size
puts

# A restricted array could be constructed of a random size (1 to 20) like so
another_array = RestrictedArray.new()
another_array_length = length(another_array)
puts "The length of my random length, integer array is #{another_array_length}."
puts

# print the current array
print "Printing values in the array: "
print_array(another_array)
# reverse the values in the current array
reverse(another_array, another_array_length)
# prints the reversed array
print "Reversed array: "
print_array(another_array)
puts

# search for value_to_find in the array
value_to_find = 120
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
end
puts

# search for value_to_find in the array - find the last value
value_to_find = another_array[another_array_length-1]
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts

# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# # delete the first entry with the value_to_delete
# value_to_delete = another_array[another_array_length/2]
# delete(another_array, another_array_length, value_to_delete)
# print "#{value_to_delete} deleted from array: "
# print_array(another_array)
# puts

# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts

# empty array
empty(another_array, another_array_length)
print "Emptied array looks like: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts
