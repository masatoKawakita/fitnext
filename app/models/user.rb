class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex: { 男: 1, 女: 2, その他: 3}
  validates :name, :birthday, :sex, :tel, presence: true
  validates :email, uniqueness: true
end
