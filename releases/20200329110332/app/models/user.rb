class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :old, presence: true
  validates :sex, presence: true
  validates :job, presence: true
  validates :deposit, presence: true
  validates :member, presence: true

  has_many :balances, dependent: :destroy
  has_one :fixed_cost, dependent: :destroy
  has_one :communication, through: :fixed_cost, dependent: :destroy
  has_one :tax, through: :fixed_cost, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_one :lifeline, dependent: :destroy
  has_many :movings, dependent: :destroy
  has_many :proportial_costs, dependent: :destroy
  has_many :movings, dependent: :destroy
  has_many :targets, dependent: :destroy

  enum sex: { 男性: 0, 女性: 1, その他: 2 }
end
