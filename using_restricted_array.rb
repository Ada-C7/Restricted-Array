require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# An unused space in the restricted array has the 'SPECIAL_VALUE'
SPECIAL_VALUE = 9999

## Calculates the length of the restricted integer array_size
def length(array)
  count = 0

  until array[count] == nil do
    count += 1
  end

  return count
  # puts "NOT IMPLEMENTED"
end

# Prints each integer values in the array
def print_array(array)
  i = 0
  until array[i] == nil do
    # only print spaces in array that are used
    if array[i] != SPECIAL_VALUE
      puts array[i]
    end
    i += 1
  end
  # puts "NOT IMPLEMENTED"
end

# Reverses the values in the integer array
def reverse(array, length) # Ruby
  if length <= 1
    return array
  end

  i = 0
  j = length-1

  while i < j do
    # puts "i: #{i} array[i]: #{array[i]}"
    # puts "j: #{j} array[j]: #{array[j]}"
    temp = array[j]
    array[j] = array[i]
    array[i] = temp
    i += 1
    j -= 1
  end

  return array

  # puts "NOT IMPLEMENTED"
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0

  while i < length
    if array[i] == value_to_find
      return true
    else
      i += 1
    end
  end
  return false
  # puts "NOT IMPLEMENTED"
end

# Sorts the array in ascending order.
def sort(array, length)

  i = 0
  j = 1
  while i < length do
    # puts "****i: #{i} array#{i}: #{array[i]}"
    while j < length do
      # puts "j: #{j} array#{j}: #{array[j]}"
      if array[j] < array[i]
        temp = array[j]
        array[j] = array[i]
        array[i] = temp
      end
      j+= 1
    end
    i += 1
    j = i+1
  end

  return array

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
        until array[i] == nil do
          if array[i+1] == nil
            array[i] = SPECIAL_VALUE
          else
            array[i] = array[i+1]
          end
          i += 1
        end
      else
        i += 1
      end
  end
  return array

  # puts "NOT IMPLEMENTED"
end

# Restricted array cannot be resized. So, we workaround by having a convention
# Convention: replace all values with 'SPECIAL_VALUE'
# Empties the restricted array by making all values = SPECIAL_VALUE
def empty(array, length)
  i = 0
  while i < length
    array[i] = SPECIAL_VALUE
    i += 1
  end
  # puts "NOT IMPLEMENTED"
end

# Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest = array[0]
  i = 1
  while i < length
    if array[i] > largest && array[i] != SPECIAL_VALUE
      largest = array[i]
    end
    i += 1
  end
  return largest
  # puts "NOT IMPLEMENTED"
end

# Insert value to insert at the correct index into the array assuming the array
# is sorted in ascending manner.
# Restricted arrays cannot be resized. Insert only if there is space in the array.
# (Hint: if there are no elements with 'SPECIAL_VALUE', there is no room to insert)
# All subsequent elements will need to be moved forward by one index.
def insert_ascending(array, length, value_to_insert)
  print_array(array)
  # puts "value to insert: #{value_to_insert}"
  has_room = false
  i = 0
  until array[i] == nil || has_room == true do
    if array[i] == SPECIAL_VALUE
      has_room = true
    else
      i += 1
    end
  end
  # puts "has room: #{has_room} index: #{i}"

  if has_room == true
    if i == 0
      array[i] = value_to_insert
    else
      while array[i] == nil || array[i-1] > value_to_insert do
        # puts "#{array[i] > value_to_insert} // array [#{i}]: #{array[i]}; array[#{i-1}]: #{array[i-1]}"
        array[i] = array[i-1]
        i -= 1

      end
      array[i] = value_to_insert
      # puts "array #{i}: #{array[i]}"
      # insert array
    end
  else
    puts "no room"
    return array
  end

  return array

  # puts "NOT IMPLEMENTED"
end

## --- END OF METHODS ---


# A restricted array could be constructed of a given size like so
puts "********Test 1********"
size = 5
my_integer_array = RestrictedArray.new(size)
my_integer_array_length = length(my_integer_array)
puts "The length of my integer array is #{my_integer_array_length}, which should be the same as #{size}."
puts "BUG!" if my_integer_array_length != size
puts

# A restricted array could be constructed of a random size (1 to 20) like so
puts "********Test 2********"
another_array = RestrictedArray.new()
another_array_length = length(another_array)
puts "The length of my random length, integer array is #{another_array_length}."
puts

# print the current array
puts "********Test 3********"
print "Printing values in the array: "
print_array(another_array)
puts

# reverse the values in the current array
puts "********Test 4*******"
reverse(another_array, another_array_length)
# prints the reversed array
print "Reversed array: "
print_array(another_array)
puts

# search for value_to_find in the array
puts "********Test 5********"
value_to_find = 120
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
end
puts

# search for value_to_find in the array - find the last value
puts "********Test 6********"
value_to_find = another_array[another_array_length-1]
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts

# print the largest value in the array
puts "********Test 7********"
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
puts "********Test 8********"
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
puts "********Test 9********"
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
puts "********Test 10********"
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# print the largest value in the array
puts "********Test 11********"
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
puts "********Test 12********"
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
puts "********Test 13********"
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
puts "********Test 14********"
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts


# empty array
puts "********Test 15********"
empty(another_array, another_array_length)
print "Emptied array looks like: "
print_array(another_array)
puts
