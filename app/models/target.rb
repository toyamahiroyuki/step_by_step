class Target < ApplicationRecord
 belongs_to :user
 has_many :target_items
end
