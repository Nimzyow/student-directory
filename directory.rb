# Lets put all students into an array
students = [
  "Dr. Hannibal Lector",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
puts "the students of Villains Academy"
puts "--------------"
#Lets print them
students.each do |name|
  puts name
end
puts "Overall, we have #{students.count} great students"
