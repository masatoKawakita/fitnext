class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  enum sex: { 男: 1, 女: 2, その他: 3}
  validates :name, presence: true, length: { maximum: 100 }
  validates :birthday, :sex, :tel, presence: true
  validates :email, uniqueness: true,  presence: true, length: { maximum: 200 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  mount_uploader :picture, PictureUploader

  has_one :trainer, inverse_of: :user
  accepts_nested_attributes_for :trainer
  has_many :trainer_evaluations
end
