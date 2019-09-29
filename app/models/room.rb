class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # current_userと話し相手のDMルームをfind or create
  # 条件1: current_user と 話相手がentryされてる
  # 条件2: 同じroom_id
  # 条件3: current_user と 話相手"のみ"entryされてる = entiryされてるuserのlegthが2
  def self.DM_find_or_create_by_current_users(user)
    current_user = User.current_user
    return unless current_user
    room = user.get_current_DM_room()
    unless room
      room = Room.create()
      Entry.create(room_id: room.id, user_id: current_user.id)
      Entry.create(room_id: room.id, user_id: user.id)
    end
    room
  end
end
