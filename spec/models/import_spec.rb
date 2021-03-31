require 'rails_helper'

RSpec.describe Import, type: :model do
  describe '.column_names' do
    let(:expected_columns) do
      %w[id buyer description unit_price quantity address supplier created_at updated_at]
    end

    it 'Return an array with all model column names' do
      expect(described_class.column_names).to eq(expected_columns)
    end
  end
end
