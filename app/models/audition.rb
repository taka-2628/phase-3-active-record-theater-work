class Audition < ActiveRecord::Base
  belongs_to :role

  def call_back
    self.update(hires: true)
  end

end