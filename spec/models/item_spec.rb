require 'rails_helper'

describe Item do
  it { should validate_presence_of :name }
  it { should belong_to :user}

  it "should be automatically removed after 7 days"
end
