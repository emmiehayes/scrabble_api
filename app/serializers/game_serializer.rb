class GameSerializer < ActiveModel::Serializer
  attributes :id,:player_1_id, :player_2_id
end