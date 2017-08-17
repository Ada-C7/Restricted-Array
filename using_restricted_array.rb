require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# An unused space in the restricted array has the 'SPECIAL_VALUE'
SPECIAL_VALUE = 9999

## Calculates the length of the restricted integer array_size
def length(array)
  length = 0;
  element = array[length];
  until element == nil
    length += 1
    element = array[length]
  end
  return length
end

# Prints each integer values in the array
def print_array(array)
  size = length(array)

  for i in 0..size
    print "#{array[i]} "
  end
end

# Reverses the values in the integer array
def reverse(array, length) # Ruby
  j = length-1
  for i in 0..length
    until i > j
      temp = array[i]
      array[i] = array[j]
      array[j] = temp
      i += 1
      j -= 1
    end
  end
  return array
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  for i in 0..length-1
    if array[i] == value_to_find
      return true
    end
  end
  return false
end

# Sorts the array in ascending order.
def sort(array, length)
  for i in 0..length-1
    min_index = i

    j = i + 1

    while j < length
      if array[min_index] > array[j]
        min_index = j
      end
      j += 1
    end
    temp = array[i]
    array[i] = array[min_index]
    array[min_index] = temp
  end
end

# Restricted arrays cannot be resized. So, we follow a convention.
# Convention: change the value to be deleted with 'SPECIAL_VALUE'
# Deletes 'value_to_delete' if found in the array. To keep the array size
# constant, adds an element with 'SPECIAL_VALUE' in the end. Assumes the array
# to be sorted in ascending order.
def delete(array, length, value_to_delete)
  for i in 0..length-1
    if array[i] == value_to_delete
      array[i] = SPECIAL_VALUE
    end
  end
end

# Restricted array cannot be resized. So, we workaround by having a convention
# Convention: replace all values with 'SPECIAL_VALUE'
# Empties the restricted array by making all values = SPECIAL_VALUE
def empty(array, length)
  for i in 0..length-1
    array[i] = SPECIAL_VALUE
  end
end

# Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
# Assumes that the array is not sorted.
def find_largest(array, length)
  max_num = 0
  for i in 0..length-1
    if array[i] > max_num && array[i] != SPECIAL_VALUE
      max_num = array[i]
    end
  end
  return max_num
end

# Insert value to insert at the correct index into the array assuming the array
# is sorted in ascending manner.
# Restricted arrays cannot be resized. Insert only if there is space in the array.
# (Hint: if there are no elements with 'SPECIAL_VALUE', there is no room to insert)
# All subsequent elements will need to be moved forward by one index.
def insert_ascending(array, length, value_to_insert)
  temp = nil
  is_inserted = false
  return array if array[length - 1] != SPECIAL_VALUE
  for i in 0..length-1
    if is_inserted == true
      array[i], temp = temp, array[i]
    end

    if value_to_insert <= array[i] && !is_inserted && array[i] != SPECIAL_VALUE
      temp = array[i]
      array[i] = value_to_insert
      is_inserted = true
    end

  end

  if array[0] == SPECIAL_VALUE
    array[0] = value_to_insert
  end

  return array
end

## --- END OF METHODS ---

# A restricted array could be constructed of a given size like so
size = 5
my_integer_array = RestrictedArray.new(size)
my_integer_array_length = length(my_integer_array)
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

# delete the first entry with the value_to_delete
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
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
