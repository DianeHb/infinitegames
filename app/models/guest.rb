class Guest < ApplicationRecord
  belongs_to :user

  def first_name
    name
  end

end
