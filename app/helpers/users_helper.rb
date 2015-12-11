module UsersHelper
  def perfection(user)
    p = User.column_names.size.to_f
    b = (user.attributes.values.count{|u| u.blank?}-3).to_f
    match = ((p-b)/p)*100
  end

  def getage(birth)
    old = Time.now - birth.to_time
    ages = (old/(60*60*24*365)).to_i
  end

  def constellation(birth)
    bir = birth.to_date
    y = bir.year.to_s
    start = ['03-21','04-20','05-21','06-21','07-22','08-23','09-23','10-23','11-22','12-22','01-20','02-19'].map {|x| (y+'-'+x).to_date }
    stop = ['04-19','05-20','06-20','07-21','08-22','09-22','10-22','11-21','12-21','01-19','02-18','03-20'].map {|x| (y+'-'+x).to_date }
    star = ['牡羊座♈️','金牛座♉️','双子座♊️','巨蟹座♋️','狮子座♌️','处女座♍️','天秤座♎️','天蝎座♏️','射手座♐️','摩羯座♑️','水瓶座♒️','双鱼座♓️']
    ceach = ""
    (0..11).each do |i|
      if bir >= start[i] && bir <= stop[i]
        ceach = star[i]
      end
    end
    return ceach
  end
end

                                                           