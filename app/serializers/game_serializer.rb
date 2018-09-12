class GameSerializer < ActiveModel::Serializer
  attributes :id, :player_1_id, :player_2_id
end

#leaving off here for now- need to pull in attributes for user based on player as well as the player/user.score