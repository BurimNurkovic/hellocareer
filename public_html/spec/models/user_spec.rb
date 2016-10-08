require 'spec_helper'

describe User do
  before :each do
    @user = User.create(FactoryGirl.attributes_for(:user))
  end
  describe 'views' do
    it 'returns a hash of type {resume_id => resume_views}' do
      first = @user.resumes.create(FactoryGirl.attributes_for(:resume).merge(views_count: 4))
      second = @user.resumes.create(FactoryGirl.attributes_for(:resume).merge(views_count: 10))
      third = @user.resumes.create(FactoryGirl.attributes_for(:resume))

      views = @user.views
      expect(views[first.id]).to eq(4)
      expect(views[second.id]).to eq(10)
      expect(views[third.id]).to eq(0)

      expect(views.values.reduce(:+)).to eq(14)
    end
  end
end
