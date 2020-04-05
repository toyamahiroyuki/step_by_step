class Income < ApplicationRecord
  belongs_to :user

  enum income_item: { 給料: 0, 手当て: 1, 退職金: 2, その他: 3 }
end
