class Game < ApplicationRecord
  belongs_to :user, optional: :true

  after_initialize :init

  def init
    self.is_over ||= false
  end


end
