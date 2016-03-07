# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tab         :integer
#  content     :string(255)
#

class Option < ActiveRecord::Base
	validates :question_id, :tab, presence: true
	
  belongs_to :question
  has_one :image, as: :imageable, dependent: :destroy

  # 创建试题的4个图片选项
  def self.create_image_options(question, images)
		tabs = {0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D'}

		images.each_with_index do |image, index|
			option = question.options.create!(tab: tabs[index], content: nil)
			option.build_image(avatar: image[1]) if image.present?
			raise ActiveRecord::Rollback unless option.image.save!
		end
  end

  # 更新试题的4个图片选项
  def self.update_image_options(question_id, images)
		tabs = {0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D'}
		options = Question.find(question_id).options
		
		images.each_with_index do |image, index|
			options[index].image.avatar = nil
			options[index].build_image(avatar: image[1]) if image.present?
			raise ActiveRecord::Rollback unless options[index].image.save!
    end
  end
end
