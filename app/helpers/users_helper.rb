module UsersHelper
  def perfection(user)
    p = User.column_names.size.to_f
    b = (user.attributes.values.count{|u| u.blank?}-3).to_f
    match = ((p-b)/p)*100
  end

  def getage(age)
    age.split('/').first
    
  end
end

                                                           