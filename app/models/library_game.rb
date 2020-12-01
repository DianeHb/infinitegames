class LibraryGame < ApplicationRecord
  belongs_to :game
  belongs_to :owner, class_name: "User"
  belongs_to :borrower, polymorphic: true
end
