require 'rails_helper'

RSpec.describe FavorResponse, :type => :model do
  let(:favor_response) { FavorResponse.new }

  it { should belong_to(:favor) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:favor_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:can_help_at) }
endqq
