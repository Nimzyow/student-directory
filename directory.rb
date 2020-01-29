# Lets put all students into a hash for better readability

def interactive_menu
  students = []
  loop do
    print_instructions
    process(gets.chomp, students)
  end
end

def process(selection, students)
  case selection
    when "1"
      students = input_students(students)
    when "2"
      show_students(students)
    when "3"
      save_students(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students(students)
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  students.each do |student|
    student_data = [student[:name], student[:cohort],
    student[:hobby], student[:height]]
    csv_line = student_data.join(",")
    puts csv_line
    file.puts csv_line
    puts "we got to save"
  end
  file.close
end

def print_instructions
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.cvs"
  puts "9. Exit"
end

def show_students(students)
  print_header
  print_students_list(students)
  print_footer(students)
end

def input_students(students)
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  new_student = input_students_properties
  while !new_student[:name].empty? do
    enter_student_into_database(new_student, students)
    count_students(students)
    puts "Enter another students name"
    new_student = input_students_properties
  end
  return students
end

def enter_student_into_database(new_student, students)
  #the << is called a shovel operator to put things into an array
  students << {name: new_student[:name], hobby: new_student[:hobby],
    height: new_student[:height], cohort: new_student[:cohort]}
end

def input_students_properties
  name = gets.chomp
  if !name.empty?
    puts "Please enter cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november".to_sym
    end
    hobby = input_students_attribute("hobby")
    height = input_students_attribute("height")
    return {name: name, hobby: hobby, cohort: cohort, height: height}
  else
    return {name: ""}
  end
end

def input_students_attribute(property)
  puts "Please enter #{property} of the student"
  return gets.chomp
end

def print_header
  puts "the students of Villains Academy"
  puts "--------------"
end

def count_students(students)
  puts "Now we have #{students.count} students"
end

def print_students_list(students)
  if students.length != 0
    puts "enter cohort. To display all students, simply press Enter"
    cohort_selection = gets.chomp
    if !cohort_selection.empty?
      students.map.with_index  {|student, index|
      #code exercise to print only specific cohort
        if student[:cohort] == cohort_selection
            print_message(student, index)
        end}
    else
      students.map.with_index  {|student, index|
        print_message(student, index)}
    end
  end
end

def print_message(student, index)
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)
        with a height of #{student[:height]} and hobby of
        #{student[:hobby]}"
end

#Lets print them
def print_footer(names)
  if names.length != 1
    puts "Overall, we have #{names.count} great students".center(50, "*")
  elsif names.length == 1
    puts "Overall, we have #{names.count} great student".center(50, "*")
  else names.length == 0
    puts " No students in this academy"
  end
end

interactive_menu
