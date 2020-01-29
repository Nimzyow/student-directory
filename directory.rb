# Lets put all students into a hash for better readability

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  #while the name is not empty, repeat this code
  if !name.empty?
    puts "Please enter cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november".to_sym
    end
    puts "Please enter hobby of the student"
    hobby = gets.chomp
    puts "Please enter height of the student"
    height = gets.chomp
    puts "Please enter country of birth of the student"
  end
  while !name.empty? do
    #the << is called a shovel operator and it's used to put
    #things into an array

    students << {name: name, hobby: hobby, height: height, cohort: cohort}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Enter another students name"
    name = gets.chomp
    if !name.empty?
      puts "Please enter cohort"
      cohort = gets.chomp
      if cohort.empty?
        cohort = "november".to_sym
      end
      puts "Please enter hobby of the student"
      hobby = gets.chomp
      puts "Please enter height of the student"
      height = gets.chomp
      puts "Please enter country of birth of the student"
    end
  end
  return students
end

def print_header
  puts "the students of Villains Academy"
  puts "--------------"
end

def print(students)
  puts "enter cohort to display students. If you want to display all students,
   simply press Enter"
  cohort_selection = gets.chomp
  if !cohort_selection.empty?
    students.map.with_index  {|student, index|
    #code exercise to print only specific cohort
      if student[:cohort] == cohort_selection
          puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)
                with a height of #{student[:height]} and hobby of
                #{student[:hobby]}"
      end}
  else
    students.map.with_index  {|student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)
    with a height of #{student[:height]} and hobby of #{student[:hobby]}"}
  end
end

#Lets print them
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50, "*")
end

students = input_students
print_header
print(students)
print_footer(students)
