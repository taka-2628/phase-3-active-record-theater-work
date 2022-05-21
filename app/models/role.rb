class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map(&:actor)
  end

  def locations
    self.auditions.map(&:location)
  end

  def lead
    first_hired = self.auditions.select{|aud| aud.hired}.first
    if first_hired
      first_hired
    else 
      'no actor has been hired for this role'
    end
  end

  def understudy
    second_hired = self.auditions.select{|aud| aud.hired}.second
    if second_hired
      second_hired
    else 
      'no actor has been hired for understudy for this role'
    end
  end

end