class Balance < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
