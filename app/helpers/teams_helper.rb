module TeamsHelper
	def generate_teams

     unassigned_students = []

     Student.all.each do |student|
         unassigned_students.push(student.name)
     end
     num_teams = 5   # hardcoding for now

	 team_size = unassigned_students.count / num_teams

	 teams = [ ]
      # randomly sample from unassigned_students array based on team size

 	 until teams.count == num_teams     
    	teammates = unassigned_students.sample(team_size) 
         # push randomly selected array of random students as teammates to teams array
     	teams.push(teammates)
         # remove each assigned studentfrom unassigned_students array
       teammates.each do |student| 
        unassigned_students.delete(student)
       end
     end
     	unassigned_students.each_with_index do |student, index|
      		teams[index].push(student)
   		end
     return teams
   end
end


