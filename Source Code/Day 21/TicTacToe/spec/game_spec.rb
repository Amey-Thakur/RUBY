# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength

describe Game do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
  end

  describe '#play' do
    it 'shows the board' do
      allow(game).to receive(:game_set_up)
      allow(game).to receive(:player_turns)
      allow(game).to receive(:conclusion)
      expect(game.board).to receive(:show)
      game.play
    end
  end

  describe '#create_player' do
    it 'creates player #1' do
      player_name = 'Alpha'
      player_symbol = 'a'
      allow(game).to receive(:puts)
      allow(game).to receive(:display_name_prompt).with(1)
      allow(game).to receive(:gets).and_return(player_name)
      allow(game).to receive(:symbol_input).and_return(player_symbol)
      expect(Player).to receive(:new).with(player_name, player_symbol)
      game.create_player(1)
    end
  end

  describe '#turn' do
    it 'updates the board' do
      game.instance_variable_set(:@first_player, instance_double(Player))
      player_symbol = 'x'
      player_input = 2
      allow(game.first_player).to receive(:symbol).and_return(player_symbol)
      allow(game).to receive(:turn_input).with(game.first_player).and_return(player_input)
      allow(game.board).to receive(:show)
      expect(game.board).to receive(:update_board).with(player_input - 1, player_symbol)
      game.turn(game.first_player)
    end
  end
end

# rubocop:enable Metrics/BlockLength
