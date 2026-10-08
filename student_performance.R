student_data <- data.frame(
  RollNo = c(101, 102, 103, 104, 105, 106, 107, 108),
  Name = c("Arun", "Divya", "Kavin", "Meena",
           "Ravi", "Priya", "Sanjay", "Anitha"),
  Department = c("AI&DS", "AI&DS", "CSE", "IT",
                 "CSE", "IT", "AI&DS", "CSE"),
  Tamil = c(85, 72, 65, 90, 55, 78, 45, 88),
  English = c(78, 80, 70, 88, 60, 82, 50, 85),
  Maths = c(90, 75, 68, 95, 58, 80, 48, 92),
  Grade = c("A", "B", "C", "A", "D", "B", "F", "A")
)
print(student_data)
cat("\nFrequency Table of Grades:\n")
grade_frequency <- table(student_data$Grade)
print(grade_frequency)
student_data$Grade <- factor(
  student_data$Grade,
  levels = c("A", "B", "C", "D", "F")
)
cat("\nGrade as Factor:\n")
print(student_data$Grade)
student_data$Total <- student_data$Tamil +
  student_data$English +
  student_data$Maths
student_data$Average <- student_data$Total / 3
cat("\nData Frame with Total and Average:\n")
print(student_data)
student_data <- student_data[-7, ]
student_data$Department <- NULL
cat("\nFinal Data Frame after Deleting Row and Column:\n")
print(student_data)