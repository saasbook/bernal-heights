issues = ["Car Break-In", "Abandoned Car", "Broken Streetlight", "Illegal Drug Transactions", "Litter/Dumping Trash", "Public Drinking and Noise", "Other"]
puts "================= CREATED ISSUES ================"

issues.each do |issue|
  Issue.where(issue_type: issue).first_or_create!
  puts "    #{issue}"
end