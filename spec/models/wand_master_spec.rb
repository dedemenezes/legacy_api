# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WandMaster, type: :model do

  describe '#assign_master' do

    context 'when provide hash without key `masters' do
      subject = WandMaster.new
      # master_hash = {'masters' => [{path: 'wand_path' }]}
      it 'do not raise error' do
        expect { subject.assign_master({'teste' => [wand: 0]}) }.to_not raise_error
      end
    end
  end
end
