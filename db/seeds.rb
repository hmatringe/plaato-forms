# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sub1 = Submission.create kind: :manual_sampling_cost
sleep 1
sub2 = Submission.create kind: :tanks_increased_turnover_potential
sleep 1
sub3 = Submission.create kind: :tanks_increased_turnover_potential
sleep 1
sub4 = Submission.create kind: :tanks_increased_turnover_potential
sub1.done!
sub2.sent!
sub3.parsed!
