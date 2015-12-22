# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
	Question.destroy_all
	# 初级、能力1、4种题型
	Question.create!(id: 1, problem: "问题1", level: 1, power: 1, genre: 1, answer: 1, kind: 0)
	Question.create!(id: 2, problem: "问题2", level: 1, power: 1, genre: 2, answer: 2, kind: 0)
	Question.create!(id: 3, problem: "问题3", level: 1, power: 1, genre: 3, answer: 3, kind: 0)
	Question.create!(id: 4, problem: "问题4", level: 1, power: 1, genre: 4, answer: 4, kind: 0)
	# 中级、能力1、4种题型
	Question.create!(id: 5, problem: "问题5", level: 2, power: 1, genre: 1, answer: 1, kind: 0)
	Question.create!(id: 6, problem: "问题6", level: 2, power: 1, genre: 2, answer: 2, kind: 0)
	Question.create!(id: 7, problem: "问题7", level: 2, power: 1, genre: 3, answer: 3, kind: 0)
	Question.create!(id: 8, problem: "问题8", level: 2, power: 1, genre: 4, answer: 4, kind: 0)
	# 高级、能力1、4种题型
	Question.create!(id: 9, problem: "问题9", level: 3, power: 1, genre: 1, answer: 1, kind: 0)
	Question.create!(id: 10, problem: "问题10", level: 3, power: 1, genre: 2, answer: 2, kind: 0)
	Question.create!(id: 11, problem: "问题11", level: 3, power: 1, genre: 3, answer: 3, kind: 0)
	Question.create!(id: 12, problem: "问题12", level: 3, power: 1, genre: 4, answer: 4, kind: 0)

	# 初级、能力2、4种题型
	Question.create!(id: 13, problem: "问题13", level: 1, power: 2, genre: 1, answer: 1, kind: 0)
	Question.create!(id: 14, problem: "问题14", level: 1, power: 2, genre: 2, answer: 2, kind: 0)
	Question.create!(id: 15, problem: "问题15", level: 1, power: 2, genre: 3, answer: 3, kind: 0)
	Question.create!(id: 16, problem: "问题16", level: 1, power: 2, genre: 4, answer: 4, kind: 0)
	# 中级、能力2、4种题型
	Question.create!(id: 17, problem: "问题17", level: 2, power: 2, genre: 1, answer: 1, kind: 0)
	Question.create!(id: 18, problem: "问题18", level: 2, power: 2, genre: 2, answer: 2, kind: 0)
	Question.create!(id: 19, problem: "问题19", level: 2, power: 2, genre: 3, answer: 3, kind: 0)
	Question.create!(id: 20, problem: "问题20", level: 2, power: 2, genre: 4, answer: 4, kind: 0)
	# 高级、能力2、4种题型
	Question.create!(id: 21, problem: "问题21", level: 3, power: 2, genre: 1, answer: 1, kind: 0)
	Question.create!(id: 22, problem: "问题22", level: 3, power: 2, genre: 2, answer: 2, kind: 0)
	Question.create!(id: 23, problem: "问题23", level: 3, power: 2, genre: 3, answer: 3, kind: 0)
	Question.create!(id: 24, problem: "问题24", level: 3, power: 2, genre: 4, answer: 4, kind: 0)

	Option.destroy_all
	Option.create(id: 1, question_id: 1, tab: 1, content: "答案a" )
	Option.create(id: 2, question_id: 1, tab: 2, content: "答案b" )
	Option.create(id: 3, question_id: 1, tab: 3, content: "答案c" )
	Option.create(id: 4, question_id: 1, tab: 4, content: "答案d" )

	Option.create(id: 5, question_id: 2, tab: 1, content: "答案a" )
	Option.create(id: 6, question_id: 2, tab: 2, content: "答案b" )
	Option.create(id: 7, question_id: 2, tab: 3, content: "答案c" )
	Option.create(id: 8, question_id: 2, tab: 4, content: "答案d" )

	Option.create(id: 9, question_id: 3, tab: 1, content: "答案a" )
	Option.create(id: 10, question_id: 3, tab: 2, content: "答案b" )
	Option.create(id: 11, question_id: 3, tab: 3, content: "答案c" )
	Option.create(id: 12, question_id: 3, tab: 4, content: "答案d" )

	Option.create(id: 13, question_id: 4, tab: 1, content: "答案a" )
	Option.create(id: 14, question_id: 4, tab: 2, content: "答案b" )
	Option.create(id: 15, question_id: 4, tab: 3, content: "答案c" )
	Option.create(id: 16, question_id: 4, tab: 4, content: "答案d" )


	Option.create(id: 17, question_id: 5, tab: 1, content: "答案a" )
	Option.create(id: 18, question_id: 5, tab: 2, content: "答案b" )
	Option.create(id: 19, question_id: 5, tab: 3, content: "答案c" )
	Option.create(id: 20, question_id: 5, tab: 4, content: "答案d" )

	Option.create(id: 21, question_id: 6, tab: 1, content: "答案a" )
	Option.create(id: 22, question_id: 6, tab: 2, content: "答案b" )
	Option.create(id: 23, question_id: 6, tab: 3, content: "答案c" )
	Option.create(id: 24, question_id: 6, tab: 4, content: "答案d" )

	Option.create(id: 25, question_id: 7, tab: 1, content: "答案a" )
	Option.create(id: 26, question_id: 7, tab: 2, content: "答案b" )
	Option.create(id: 27, question_id: 7, tab: 3, content: "答案c" )
	Option.create(id: 28, question_id: 7, tab: 4, content: "答案d" )

	Option.create(id: 29, question_id: 8, tab: 1, content: "答案a" )
	Option.create(id: 30, question_id: 8, tab: 2, content: "答案b" )
	Option.create(id: 31, question_id: 8, tab: 3, content: "答案c" )
	Option.create(id: 32, question_id: 8, tab: 4, content: "答案d" )


	Option.create(id: 33, question_id: 9, tab: 1, content: "答案a" )
	Option.create(id: 34, question_id: 9, tab: 2, content: "答案b" )
	Option.create(id: 35, question_id: 9, tab: 3, content: "答案c" )
	Option.create(id: 36, question_id: 9, tab: 4, content: "答案d" )

	Option.create(id: 37, question_id: 10, tab: 1, content: "答案a" )
	Option.create(id: 38, question_id: 10, tab: 2, content: "答案b" )
	Option.create(id: 39, question_id: 10, tab: 3, content: "答案c" )
	Option.create(id: 40, question_id: 10, tab: 4, content: "答案d" )

	Option.create(id: 41, question_id: 11, tab: 1, content: "答案a" )
	Option.create(id: 42, question_id: 11, tab: 2, content: "答案b" )
	Option.create(id: 43, question_id: 11, tab: 3, content: "答案c" )
	Option.create(id: 44, question_id: 11, tab: 4, content: "答案d" )

	Option.create(id: 45, question_id: 12, tab: 1, content: "答案a" )
	Option.create(id: 46, question_id: 12, tab: 2, content: "答案b" )
	Option.create(id: 47, question_id: 12, tab: 3, content: "答案c" )
	Option.create(id: 48, question_id: 12, tab: 4, content: "答案d" )


	Option.create(id: 49, question_id: 13, tab: 1, content: "答案a" )
	Option.create(id: 50, question_id: 13, tab: 2, content: "答案b" )
	Option.create(id: 51, question_id: 13, tab: 3, content: "答案c" )
	Option.create(id: 52, question_id: 13, tab: 4, content: "答案d" )

	Option.create(id: 53, question_id: 14, tab: 1, content: "答案a" )
	Option.create(id: 54, question_id: 14, tab: 2, content: "答案b" )
	Option.create(id: 55, question_id: 14, tab: 3, content: "答案c" )
	Option.create(id: 56, question_id: 14, tab: 4, content: "答案d" )

	Option.create(id: 57, question_id: 15, tab: 1, content: "答案a" )
	Option.create(id: 58, question_id: 15, tab: 2, content: "答案b" )
	Option.create(id: 59, question_id: 15, tab: 3, content: "答案c" )
	Option.create(id: 60, question_id: 15, tab: 4, content: "答案d" )

	Option.create(id: 61, question_id: 16, tab: 1, content: "答案a" )
	Option.create(id: 62, question_id: 16, tab: 2, content: "答案b" )
	Option.create(id: 63, question_id: 16, tab: 3, content: "答案c" )
	Option.create(id: 64, question_id: 16, tab: 4, content: "答案d" )


	Option.create(id: 65, question_id: 17, tab: 1, content: "答案a" )
	Option.create(id: 66, question_id: 17, tab: 2, content: "答案b" )
	Option.create(id: 67, question_id: 17, tab: 3, content: "答案c" )
	Option.create(id: 68, question_id: 17, tab: 4, content: "答案d" )

	Option.create(id: 69, question_id: 18, tab: 1, content: "答案a" )
	Option.create(id: 70, question_id: 18, tab: 2, content: "答案b" )
	Option.create(id: 71, question_id: 18, tab: 3, content: "答案c" )
	Option.create(id: 72, question_id: 18, tab: 4, content: "答案d" )

	Option.create(id: 73, question_id: 19, tab: 1, content: "答案a" )
	Option.create(id: 74, question_id: 19, tab: 2, content: "答案b" )
	Option.create(id: 75, question_id: 19, tab: 3, content: "答案c" )
	Option.create(id: 76, question_id: 19, tab: 4, content: "答案d" )

	Option.create(id: 77, question_id: 20, tab: 1, content: "答案a" )
	Option.create(id: 78, question_id: 20, tab: 2, content: "答案b" )
	Option.create(id: 79, question_id: 20, tab: 3, content: "答案c" )
	Option.create(id: 80, question_id: 20, tab: 4, content: "答案d" )


	Option.create(id: 81, question_id: 21, tab: 1, content: "答案a" )
	Option.create(id: 82, question_id: 21, tab: 2, content: "答案b" )
	Option.create(id: 83, question_id: 21, tab: 3, content: "答案c" )
	Option.create(id: 84, question_id: 21, tab: 4, content: "答案d" )

	Option.create(id: 85, question_id: 22, tab: 1, content: "答案a" )
	Option.create(id: 86, question_id: 22, tab: 2, content: "答案b" )
	Option.create(id: 87, question_id: 22, tab: 3, content: "答案c" )
	Option.create(id: 88, question_id: 22, tab: 4, content: "答案d" )

	Option.create(id: 89, question_id: 23, tab: 1, content: "答案a" )
	Option.create(id: 90, question_id: 23, tab: 2, content: "答案b" )
	Option.create(id: 91, question_id: 23, tab: 3, content: "答案c" )
	Option.create(id: 92, question_id: 23, tab: 4, content: "答案d" )

	Option.create(id: 93, question_id: 24, tab: 1, content: "答案a" )
	Option.create(id: 94, question_id: 24, tab: 2, content: "答案b" )
	Option.create(id: 95, question_id: 24, tab: 3, content: "答案c" )
	Option.create(id: 96, question_id: 24, tab: 4, content: "答案d" )

	# 创建用户权限数据
	Permission.destroy_all
	# 普通菜鸟
	Permission.create!(id: 1, role: 1, boss: false, grade: 1, money: true, release: 0, receive_per_month: 0, meanwhile: 0)
	Permission.create!(id: 2, role: 1, boss: false, grade: 1, money: false, release: 0, receive_per_month: 3, meanwhile: 1)
	Permission.create!(id: 3, role: 1, boss: false, grade: 2, money: true, release: 0, receive_per_month: 0, meanwhile: 0)
	Permission.create!(id: 4, role: 1, boss: false, grade: 2, money: false, release: 0, receive_per_month: 2, meanwhile: 1)
	Permission.create!(id: 5, role: 1, boss: false, grade: 3, money: true, release: 0, receive_per_month: 0, meanwhile: 0)
	Permission.create!(id: 6, role: 1, boss: false, grade: 3, money: false, release: 0, receive_per_month: 1, meanwhile: 1)
	Permission.create!(id: 7, role: 1, boss: false, grade: 4, money: true, release: 0, receive_per_month: 0, meanwhile: 0)
	Permission.create!(id: 8, role: 1, boss: false, grade: 4, money: false, release: 0, receive_per_month: 1, meanwhile: 1)
	# 黄金菜鸟
	Permission.create!(id: 9, role: 2, boss: false, grade: 1, money: true, release: 0, receive_per_month: 5, meanwhile: 3)
	Permission.create!(id: 10, role: 2, boss: false, grade: 1, money: false, release: 0, receive_per_month: 9999, meanwhile: 5)
	Permission.create!(id: 11, role: 2, boss: false, grade: 2, money: true, release: 0, receive_per_month: 3, meanwhile: 2)
	Permission.create!(id: 12, role: 2, boss: false, grade: 2, money: false, release: 0, receive_per_month: 9999, meanwhile: 2)
	Permission.create!(id: 13, role: 2, boss: false, grade: 3, money: true, release: 0, receive_per_month: 2, meanwhile: 1)
	Permission.create!(id: 14, role: 2, boss: false, grade: 3, money: false, release: 0, receive_per_month: 9999, meanwhile: 1)
	Permission.create!(id: 15, role: 2, boss: false, grade: 4, money: true, release: 0, receive_per_month: 1, meanwhile: 1)
	Permission.create!(id: 16, role: 2, boss: false, grade: 4, money: false, release: 0, receive_per_month: 9999, meanwhile: 1)
	#钻石菜鸟
	Permission.create!(id: 17, role: 3, boss: false, grade: 1, money: true, release: 0, receive_per_month: 9999, meanwhile: 3)
	Permission.create!(id: 18, role: 3, boss: false, grade: 1, money: false, release: 0, receive_per_month: 9999, meanwhile: 5)
	Permission.create!(id: 19, role: 3, boss: false, grade: 2, money: true, release: 0, receive_per_month: 9999, meanwhile: 3)
	Permission.create!(id: 20, role: 3, boss: false, grade: 2, money: false, release: 0, receive_per_month: 9999, meanwhile: 3)
	Permission.create!(id: 21, role: 3, boss: false, grade: 3, money: true, release: 0, receive_per_month: 9999, meanwhile: 2)
	Permission.create!(id: 22, role: 3, boss: false, grade: 3, money: false, release: 0, receive_per_month: 9999, meanwhile: 2)
	Permission.create!(id: 23, role: 3, boss: false, grade: 4, money: true, release: 0, receive_per_month: 9999, meanwhile: 2)
	Permission.create!(id: 24, role: 3, boss: false, grade: 4, money: false, release: 0, receive_per_month: 9999, meanwhile: 2)

	# 普通BOSS
	Permission.create!(id: 25, role: 4, boss: true, grade: 1, release: 2)
	Permission.create!(id: 26, role: 4, boss: true, grade: 2, release: 1)
	Permission.create!(id: 27, role: 4, boss: true, grade: 3, release: 0)
	Permission.create!(id: 28, role: 4, boss: true, grade: 4, release: 0)
	# 黄金BOSS
	Permission.create!(id: 29, role: 5, boss: true, grade: 1, release: 20)
	Permission.create!(id: 30, role: 5, boss: true, grade: 2, release: 10)
	Permission.create!(id: 31, role: 5, boss: true, grade: 3, release: 2)
	Permission.create!(id: 32, role: 5, boss: true, grade: 4, release: 0)
	# 钻石BOSS
	Permission.create!(id: 33, role: 6, boss: true, grade: 1, release: 9999)
	Permission.create!(id: 34, role: 6, boss: true, grade: 2, release: 9999)
	Permission.create!(id: 35, role: 6, boss: true, grade: 3, release: 40)
	Permission.create!(id: 36, role: 6, boss: true, grade: 4, release: 20)

rescue Exception => e
	p e.message
end