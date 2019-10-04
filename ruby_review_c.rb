# You may NOT use Google. These questions are to test how you are progressing through the material, and to give you some feedback about where you might improve. Get through as many of these as you can. If you don’t get through all of them it’s ok - they are designed to take longer than the available time. If you can’t remember a bit of code, write the pseudo-code that represents how you would write your Ruby code.

# 1.
# Create an array of strings (with five elements). Make a loop from this array, and inside that loop concatenate the string with the string “balloon”, and print this to output.
an_array = ["Element 1", "Element 2", "Element 3", "Element 4", "Element 5"]

an_array.each do |x|
    puts x + "balloon"
end
# 2.
# Define a hash with two keys, one for a first name, and the other for a last name, and give them the value of nil. Create a method that takes a hash as an argument, along with two string arguments, one for first name and one for last name. In the method, assign the first name argument to the hash’s first name key, and assign the last name argument to the last name key of the hash. Return the hash after these assignments. Call this method with the hash you created earlier, and store the result in a well named variable. 

a_hash = {"first name": nil, "last name": nil}
def set_name(a_hash, first_name, last_name)
    a_hash[:"first name"] = first_name
    a_hash[:"last name"] = last_name
    return a_hash
end

person_1 = set_name(a_hash, "Jack", "Toke")
p person_1
# 3.
# Make a class for creating cars. Give the class an initializing method that takes two arguments, a make, and a colour, and that then initializes two attributes of the same name. Make the colour attribute read and write accessible, and the make the other attribute only read accessible. Give this class an instance method called car_start, and this method will output (puts) “vrooom!” when called. Create three car objects using your car class. Read the make of two of these car objects (puts the attribute). Read the colour of one of these, change the colour, and then read the colour again. ‘Start’ two of these cars by calling the relevant method.

class Car
    attr_reader :make
    attr_accessor :colour

    def initialize(make, colour)
        @colour = colour
        @make = make
    end

    def car_start
        puts "vrooom!"
    end
end

cars = [Car.new("Toyota", "RED"), Car.new("Mazda", "BLACK"), Car.new("Honda", "BLUE")]
cars.each_with_index do |car, no| 
    puts "Car #{no + 1} Make: #{ car.make } Colour: #{car.colour}"
    car.colour = "Pink"
end

count = 0
cars.each_with_index do |car, no| 
    puts "Car #{no + 1} Make: #{ car.make } Colour: #{car.colour}"
    if count < 2
        car.car_start
    end
    count += 1
end


# 4.
# Write a method that takes one argument, a number, and that returns true if the number is divisible by 5, and false otherwise. 

def divisible?(n)
    return (n % 5).zero?
end

puts "10 is divisible by 5 => #{divisible?(10)}"
puts "10 is divisible by 5 => #{divisible?(11)}"

# 5.
# You must use your previous method in this next question. Write another method that takes an array (of numbers) as an argument. This method will use your first method to return two arrays, within one array (an array of arrays), the first array contains the numbers that are divisible by 5, and the other of the rest of the numbers. For example, if you pass the second method the array [9, 4, 25, 3, 5, 30, 2, 8, 10, 100] it would return [[25, 5, 30, 10, 100],[9, 4, 3, 2, 8, 72]].

def separate(n_array)
    div_by_5 = []
    not_div_by_5 = []
    n_array.each do |n|
        if divisible?(n)
            div_by_5 << n
        else
            not_div_by_5 << n
        end
    end
    return [div_by_5, not_div_by_5]
end

p separate([9, 4, 25, 3, 5, 30, 2, 8, 10, 100])

# 6. 

# You're writing code to control your town's traffic lights. You need a function to handle each change from green, to yellow, to red, and then to green again.

# Complete the function that takes a string as an argument representing the current state of the light and returns a string representing the state the light should change to.

# For example, update_light('green') should return 'yellow'.

def change_light(i)
    colours = ["green", "yellow", "red"]
    puts colours[i] if i >= 0 && i < colours.length
    return i + 1 if i + 1 < colours.length
    return 0
end

state = 0
(1..10).each { state = change_light(state) }

# 7. 

# Given a string of words, return the length of the shortest word(s).
def find_short(str)
    shortest = 99999999
    words = str.split
    words.each {|w| shortest = w.length if w.length < shortest }
    return shortest
end



# String will never be empty and you do not need to account for different data types.

# find_short("i want to travel the world writing code one day")
# => 1 
puts "The shortest word length is: #{find_short('i want to travel the world writing code one day')}"
# find_short("bitcoin take over the world maybe who knows perhaps")
# => 3
puts "The shortest word length is: #{find_short('bitcoin take over the world maybe who knows perhaps')}"

# 8. 

# Your task is to make a function that can take any non-negative integer as a argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.

def sort_digits(n)
    result = n.to_s.chars.sort {|a,b| b <=> a}
    result.join
end
# Examples:

# Input: 21445 Output: 54421
puts sort_digits(21445)

# Input: 145263 Output: 654321
puts sort_digits(145263)

# Input: 1254859723 Output: 9875543221
puts sort_digits(9875543221)