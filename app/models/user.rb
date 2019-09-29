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
  has_many :trainer_evaluations, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  acts_as_taggable

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end


  def get_current_room_id
    return if (!User.current_user)
    entries = self.entries.select do |entry| 
      targets = User.current_user.entries.select do |current_entry| 
        entry.room_id == current_entry.room_id
      end
      targets.length > 0
    end
    return entries.first.room_id if self.entries&.length > 0
  end

  def get_current_room
    return if (!User.current_user)
    entries = self.entries.select do |entry| 
      targets = User.current_user.entries.select do |current_entry| 
        entry.room_id == current_entry.room_id
      end
      targets.length > 0
    end
    return Room.find_by(id: self.entries.first.room_id) if self.entries&.length > 0
  end

  def get_current_DM_room_id
    return if (!User.current_user)
    entries = self.entries.select do |entry| 
      targets = User.current_user.entries.select do |current_entry| 
        entry.room_id == current_entry.room_id
      end
      targets.length > 0
    end
    return if self.entries&.length == 0
    room = Room.find_by(id: self.entries.first.room_id)
    return room.id if room.entries.length == 2
  end

  def get_current_DM_room
    return if (!User.current_user)
    entries = self.entries.select do |entry| 
      targets = User.current_user.entries.select do |current_entry| 
        entry.room_id == current_entry.room_id
      end
      targets.length > 0
    end
    return if self.entries&.length == 0
    room = Room.find_by(id: self.entries.first.room_id)
    return room if room.entries.length == 2
  end
end
