# *Feature 2: API - Viewing Game Score*

# Background: This story assumes the base data from running `rake db:seed`

# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:

# {
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }

require 'rails_helper'

describe 'user sending GET request to "/api/v1/games/1"' do
  scenario 'receives a JSON response with scores for both players' do 
    game = create(:game)

    get "/api/v1/games/#{game.id}"

    expect(response).to be_successful

    game_json = JSON.parse(response.body, symbolize_names: true)

    expect(game.id).to eq(game_json[:id])
    expect(game.player_1.id).to eq(game_json[:player_1_id])
    expect(game.player_2.id).to eq(game_json[:player_2_id])
  end
end