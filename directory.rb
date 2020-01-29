# Lets put all students into a hash for better readability

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #the << is called a shovel operator and it's used to put
    #things into an array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  return students
end

def print_header
  puts "the students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.map.with_index  {|student, index|
    #code exercise to print only names beginning with N
    if student[:name].length < 12
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end}

end
#Lets print them
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
