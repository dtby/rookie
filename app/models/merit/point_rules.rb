# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      score 10, :on => 'users#create' do |user|
        user.bio.present?
      end

      score 1, :on => 'signs#create', category: 'experience' do |task|
        User.roles[task.user.try(:role)] <= 3
      end
      score 1, :on => 'signs#create', category: 'experience' do |task|
        User.roles[task.user.try(:role)] > 3
      end

      score 5, :on => 'signs#create', category: 'coin' do |task|
        User.roles[task.user.try(:role)] <= 3
      end
      score 20, :on => 'signs#create', category: 'coin' do |task|
        User.roles[task.user.try(:role)] > 3
      end


      score 5, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'a' && User.roles[task.user.try(:role)] <= 3
      end
      score 10, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'b' && User.roles[task.user.try(:role)] <= 3
      end
      score 15, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'c' && User.roles[task.user.try(:role)] <= 3
      end
      score 30, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'd' && User.roles[task.user.try(:role)] <= 3
      end

      score 10, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'a' && User.roles[task.user.try(:role)] <= 3
      end
      score 20, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'b' && User.roles[task.user.try(:role)] <= 3
      end
      score 30, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'c' && User.roles[task.user.try(:role)] <= 3
      end
      score 100, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'd' && User.roles[task.user.try(:role)] <= 3
      end


      score 10, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'a' && User.roles[task.user.try(:role)] > 3
      end
      score 20, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'b' && User.roles[task.user.try(:role)] > 3
      end
      score 30, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'c' && User.roles[task.user.try(:role)] > 3
      end
      score 40, :on => 'tasks#create', category: 'experience' do |task|
        task.grade == 'd' && User.roles[task.user.try(:role)] > 3
      end

      score 88, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'a' && User.roles[task.user.try(:role)] > 3
      end
      score 188, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'b' && User.roles[task.user.try(:role)] > 3
      end
      score 288, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'c' && User.roles[task.user.try(:role)] > 3
      end
      score 388, :on => 'tasks#create', category: 'coin' do |task|
        task.grade == 'd' && User.roles[task.user.try(:role)] > 3
      end
    end
  end
end
