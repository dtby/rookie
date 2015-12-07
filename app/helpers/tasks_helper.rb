module TasksHelper
  def step_g(grade)
    case grade
    when 'a'
      '100'
    when 'b'
      '200'
    when 'c'
      '300'
    when 'd'
      '400'
    when 'e'
      '500'
    end
  end

  def coin(grade)
    case grade
    when 'a'
      '1000'
    when 'b'
      '2000'
    when 'c'
      '3000'
    when 'd'
      '4000'
    when 'e'
      '5000'
    end
  end
end
