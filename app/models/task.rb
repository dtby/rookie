class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_type

  enum final_education: { 'A': 1, 'B': 2, 'C': 3, 'D': 4 }
  enum final: { '上海': 1, '安徽': 2, '珠海': 3, '北京': 4 }
  enum fraction: { '1分': 1, '2分': 2, '3分': 3, '4分': 4, '5分': 5 }
end
