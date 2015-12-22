module PermissionsHelper
	def export_number number
		if number.to_i == 9999
			'不限'
		else
			number
		end
	end
end