require 'rails_helper'

describe Item do
  it { should validate_presence_of :name }
  it { should belong_to :list }

  describe '#days_left' do
    it 'should return the number of days remaining' do
      item = create(:item)
      expect(item.days_left).to eq(7)
    end

    it 'should return 5 when the item was created 2 days ago' do
      item = create(:item, created_at: 2.days.ago)
      expect(item.days_left).to eq(5)
    end
  end
  xit "should be automatically removed after 7 days"
end
