# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
	Question.delete_all
	# 初级、能力1、4种题型
	Question.create!(id: 1, problem: "问题1", level: 1, power: 1, genre: 1, answer: 1)
	Question.create!(id: 2, problem: "问题2", level: 1, power: 1, genre: 2, answer: 2)
	Question.create!(id: 3, problem: "问题3", level: 1, power: 1, genre: 3, answer: 3)
	Question.create!(id: 4, problem: "问题4", level: 1, power: 1, genre: 4, answer: 4)
	# 中级、能力1、4种题型
	Question.create!(id: 5, problem: "问题5", level: 2, power: 1, genre: 1, answer: 1)
	Question.create!(id: 6, problem: "问题6", level: 2, power: 1, genre: 2, answer: 2)
	Question.create!(id: 7, problem: "问题7", level: 2, power: 1, genre: 3, answer: 3)
	Question.create!(id: 8, problem: "问题8", level: 2, power: 1, genre: 4, answer: 4)
	# 高级、能力1、4种题型
	Question.create!(id: 9, problem: "问题9", level: 3, power: 1, genre: 1, answer: 1)
	Question.create!(id: 10, problem: "问题10", level: 3, power: 1, genre: 2, answer: 1)
	Question.create!(id: 11, problem: "问题11", level: 3, power: 1, genre: 3, answer: 1)
	Question.create!(id: 12, problem: "问题12", level: 3, power: 1, genre: 4, answer: 1)

	# 初级、能力2、4种题型
	Question.create!(id: 13, problem: "问题13", level: 1, power: 2, genre: 1, answer: 1)
	Question.create!(id: 14, problem: "问题14", level: 1, power: 2, genre: 2, answer: 1)
	Question.create!(id: 15, problem: "问题15", level: 1, power: 2, genre: 3, answer: 1)
	Question.create!(id: 16, problem: "问题16", level: 1, power: 2, genre: 4, answer: 1)
	# 中级、能力2、4种题型
	Question.create!(id: 17, problem: "问题17", level: 2, power: 2, genre: 1, answer: 1)
	Question.create!(id: 18, problem: "问题18", level: 2, power: 2, genre: 2, answer: 1)
	Question.create!(id: 19, problem: "问题19", level: 2, power: 2, genre: 3, answer: 1)
	Question.create!(id: 20, problem: "问题20", level: 2, power: 2, genre: 4, answer: 1)
	# 高级、能力2、4种题型
	Question.create!(id: 21, problem: "问题21", level: 3, power: 2, genre: 1, answer: 1)
	Question.create!(id: 22, problem: "问题22", level: 3, power: 2, genre: 2, answer: 1)
	Question.create!(id: 23, problem: "问题23", level: 3, power: 2, genre: 3, answer: 1)
	Question.create!(id: 24, problem: "问题24", level: 3, power: 2, genre: 4, answer: 1)

	Option.delete_all
	Option.create(id: 1, question_id: 1, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 2, question_id: 2, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 3, question_id: 3, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 4, question_id: 4, a: "答案a", b: "答案b", c: "答案c", d: "答案d")

	Option.create(id: 5, question_id: 5, a: "答案a", b: "答案b", c: "答案c", d: "答案d", e: "答案e")
	Option.create(id: 6, question_id: 6, a: "答案a", b: "答案b", c: "答案c", d: "答案d", e: "答案e")
	Option.create(id: 7, question_id: 7, a: "答案a", b: "答案b", c: "答案c", d: "答案d", e: "答案e")
	Option.create(id: 8, question_id: 8, a: "答案a", b: "答案b", c: "答案c", d: "答案d", e: "答案e")	

	Option.create(id: 9, question_id: 9, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 10, question_id: 10, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 11, question_id: 11, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 12, question_id: 12, a: "答案a", b: "答案b", c: "答案c", d: "答案d")

	Option.create(id: 13, question_id: 13, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 14, question_id: 14, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 15, question_id: 15, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 16, question_id: 16, a: "答案a", b: "答案b", c: "答案c", d: "答案d")	

	Option.create(id: 17, question_id: 17, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 18, question_id: 18, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 19, question_id: 19, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 20, question_id: 20, a: "答案a", b: "答案b", c: "答案c", d: "答案d")

	Option.create(id: 21, question_id: 21, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 22, question_id: 22, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 23, question_id: 23, a: "答案a", b: "答案b", c: "答案c", d: "答案d")
	Option.create(id: 24, question_id: 24, a: "答案a", b: "答案b", c: "答案c", d: "答案d")

Task_type.delete_all
	Task_type.create!(id: 1, type: "IT")
	Task_type.create!(id: 2, type: "互联网")
	Task_type.create!(id: 3, type: "设计")

rescue Exception => e
	p e.message
end