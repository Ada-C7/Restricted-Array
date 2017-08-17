require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# An unused space in the restricted array has the 'SPECIAL_VALUE'
SPECIAL_VALUE = 9999

## Calculates the length of the restricted integer array_size
def length(array)
    # have a counter that keeps track of where in the array you are
    i = 0;
    # loop through the array and check if that number is equal to nil
    while (array[i] != nil)
    # if it is not nil, increase i
        i++
    end

    # if it is nil, then the length is i
    return i

end

# Prints each integer values in the array
def print_array(array)
    i = 0;
    while (array[i] != 0)
        puts array[i]
        i++
    end
end

# Reverses the values in the integer array
def reverse(array, length) # Ruby
    # set i to be the leftmost item in array swap
    i = 0;
    # set j to be the right item
    j = array.length + 1

    # loop through while j is greater than i
    while j > i
        # have a temp variable
        temp = array[i];
        # make the left most (i) element be the right element
        array[i] = array[j];
        # make the right element equal to the left element - now in temp var
        array[j] = temp;

        # increase i and decrease j
        i +=1;
        j -=1
    end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  # loop through array based on i which starts at 0
  i = 0;
  # have loop stop at array length
  while i < array.length
      # at each part in loop look to see if the element matches value_to_find
      if array[i] == value_to_find
          # if it does, then return true
          return true
      else
          # if it does not, increase i + 1
          i++
      end
  end
  # if get through loop and has not returned true, return false
  return false
end

# Sorts the array in ascending order.
def sort(array, length)
    i = 0;
    while i < array.length
        if array[i] > array[i+1]
            j = 0;
            while j < array.length
                if array[j] > array[i + 1]
                    temp = array[j];
                    array[j] = array[i + 1];
                    array[i + 1] = temp;
                end
                j++;
            end
            j++;
        end
        i++;
    end
end

# Restricted arrays cannot be resized. So, we follow a convention.
# Convention: change the value to be deleted with 'SPECIAL_VALUE'
# Deletes 'value_to_delete' if found in the array. To keep the array size
# constant, adds an element with 'SPECIAL_VALUE' in the end. Assumes the array
# to be sorted in ascending order.
def delete(array, length, value_to_delete)
  i = 0;
  while i < array.length
      if array[i] == value_to_delete
        spaces = (array.length - 1) - i;
        moved = 0;
        until moved == spaces
            array[i] = array[i+1];
            i++;
            moved++;
        end
        array[array.length - 1] = 'SPECIAL_VALUE';
      end
      i++;
  end
end

# Restricted array cannot be resized. So, we workaround by having a convention
# Convention: replace all values with 'SPECIAL_VALUE'
# Empties the restricted array by making all values = SPECIAL_VALUE
def empty(array, length)
    i = 0;
    while i < array.length
        array[i] = 'SPECIAL_VALUE';
        i++;
    end
end

# Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
# Assumes that the array is not sorted.
def find_largest(array, length)
    i = 0;
    big = array[0];
    while i < array.length
        if array[i] > big
            big = array[i];
            i++;
        end
        i++;
    end
    return big;
end

# Insert value to insert at the correct index into the array assuming the array
# is sorted in ascending manner.
# Restricted arrays cannot be resized. Insert only if there is space in the array.
# (Hint: if there are elements with 'SPECIAL_VALUE', there is 1[\4232`  `A  room to insert)
# All subsequent elements will need to be moved forward by one index.
def insert_ascending(array, length, value_to_insert)
    if array[array.length] == 'SPECIAL_VALUE'
        i = 0;
        while i < array.length
            if array[i] > value_to_insert
                spaces = (array.length - 1) - i;
                moved = 0;
                until moved == spaces
                    array[i] = array[i+1];
                    i++;
                    moved++;
                end
            end
            i++;
        end
    end
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
