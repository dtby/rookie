module UsersHelper
  # 生成编号
  def user_code number
    cache = number.to_s
    if cache.length < 5
      cache.rjust(5, '0');
    else
      cache
    end
  end

  # 计算资料完整度
  def perfection user
    sum = 0
    user.slice(:nickname, :name, :nation, :gender, :native, :present, :email, :birth).values.each { |x| x.present? ? sum += 1 : sum }
    sum += 1 if user.educations.present?
    sum += 1 if user.works.present? 
    sum += 1 if user.internships.present?

    return "#{(sum / 11.0 * 100).round(0)}%"
  end

  # 计算年龄
  def getage(birth)
    if birth.present?
      old = Time.now - birth.to_time
      ages = (old/(60*60*24*365)).to_i
    else
      ''
    end
  end

  def constellation(birth)
    if birth.present?
      bir = birth.to_date
      y = bir.year.to_s
      start = ['03-21','04-20','05-21','06-21','07-22','08-23','09-23','10-23','11-22','12-22','01-20','02-19'].map {|x| (y+'-'+x).to_date }
      stop = ['04-19','05-20','06-20','07-21','08-22','09-22','10-22','11-21','12-21','01-19','02-18','03-20'].map {|x| (y+'-'+x).to_date }
      star = ['牡羊座♈️','金牛座♉️','双子座♊️','巨蟹座♋️','狮子座♌️','处女座♍️','天秤座♎️','天蝎座♏️','射手座♐️','摩羯座♑️','水瓶座♒️','双鱼座♓️']
      cache = ""
      (0..11).each do |i|
        if bir >= start[i] && bir <= stop[i]
          cache = star[i]
        end
      end
      return cache
    else
      return ''
    end
  end

  # 后台用户权限分类
  def user_categories
    { 
      all: "所有用户", 
      rookie: "普通菜鸟", 
      rookie_gold: "黄金菜鸟", 
      rookie_diamond: "钻石菜鸟", 
      boss: "普通BOSS", 
      boss_gold: "黄金BOSS", 
      boss_diamond: "钻石BOSS"
    }
  end

  # 成长轨迹类型
  def grow_type
    { 
      1 => 'green_1.png', 
      2 => 'red.png', 
      3 => 'yellow.png', 
      4 => 'blue.png', 
      5 => 'green.png'
    }
  end

  # 判断用户类别
  def role_kind user
    role = User.roles[user.role.to_sym].to_i
    if role >= 1 && role <= 3
      return '菜鸟'
    elsif role >=4 && role <= 6
      return 'BOSS'
    end
  end

  # 会员升级提示信息
  def vip_msg info
    if info[:type] == "rookie"
      if info[:money] == "涉及现金" && info[:vip_per_month] == "0"
        "无法申请涉及现金的任务，赶紧升级会员吧"
      elsif info[:count_per_month].to_i >= info[:vip_per_month].to_i
        "本月已接 #{info[:vip_per_month]} 个任务包，下个月再申请任务 或者 升级会员权限"
      elsif info[:count_total].to_i >= info[:vip_total].to_i
        "待完成任务已达 #{info[:vip_total]} 个，完成已接任务后再来申请 或者 升级会员权限"
      end
    elsif info[:type] == "boss"
      if info[:release_count] == "0"
        "无权发布#{info[:task_grade]}任务包，赶紧升级会员吧"
      else
        "#{info[:task_grade]}任务包的发布数量已达#{info[:release_count]}个，无法继续发布，赶紧升级会员吧"
      end
    end
  end
end

                                                           