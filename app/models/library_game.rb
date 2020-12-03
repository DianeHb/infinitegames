class LibraryGame < ApplicationRecord
  belongs_to :game
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, polymorphic: true, optional: true # optional true because with polymorphic by default presence is true
end
