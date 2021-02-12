require 'rails_helper'

RSpec.describe FilterCollateralByTagsQuery do
    describe '#result' do
        context 'when two collaterals have same weight for one tag' do
        it 'returns all collateral matching that tag' do
            tag = create(:tag)
            collateral_1 = create(:collateral)
            collateral_2 = create(:collateral)
            create(:collaterals_tag, tag: tag, collateral: collateral_1)
            create(:collaterals_tag, tag: tag, collateral: collateral_2)
            result = FilterCollateralByTagsQuery.new(['ruby']).result
            expect(result).to eq [collateral_1, collateral_2]
        end
        end
    end
end