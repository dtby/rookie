# == Schema Information
#
# Table name: permissions
#
#  id                :integer          not null, primary key
#  role              :integer
#  boss              :boolean
#  grade             :integer
#  money             :boolean
#  release           :integer
#  receive_per_month :integer
#  meanwhile         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Permission < ActiveRecord::Base

	enum grade: { a: 1, b: 2, c: 3, d: 4 }

	enum money: { yes: true, no: false}

	enum role: {admin: 0, rookie: 1, rookie_gold: 2, rookie_diamond: 3, boss: 4, boss_gold: 5, boss_diamond: 6}
  ROLE = {admin: "管理员", 
  				rookie: "普通菜鸟", 
  				rookie_gold: "黄金菜鸟", 
  				rookie_diamond: "钻石菜鸟", 
  				boss: "普通BOSS", 
  				boss_gold: "黄金BOSS", 
  				boss_diamond: "钻石BOSS"}

	BOSS = { '组员' => false, 'BOSS' => true }

end
