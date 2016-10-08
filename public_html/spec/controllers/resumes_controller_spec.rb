require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  before (:each) do
    @user = User.create!({
      :full_name => 'Test User',
      :email => 'user@test.com',
      :password => 'letmein!'
      })
    sign_in @user
  end

  describe 'GET #show' do
    before(:each) do 
      @resume = @user.resumes.create_with_associations
    end

    context 'when format.html' do
      it 'renders the :show html view' do
        get :show, id: @resume
        expect(response).to render_template :show
      end
    end

    context 'when format.pdf' do 
      it 'renders the :show pdf view' do
        get :show, format: :pdf, id: @resume
        expect(response).to render_template :show
      end
    end

    it 'returns a resume object' do 
      get :show, id: @resume
      assigns(:resume).should eq(@resume)
    end
  end

  describe 'GET #new' do
    context 'when current user has 3 resumes' do
      it 'redirects to users_dashboard_path' do
        3.times {@user.resumes.create}
        get :new
        response.should redirect_to users_dashboard_path
      end
    end

    context 'when current user has less than 3 resumes' do
      it 'creates a resume' do
        get :new
        expect{
          post :create, resume: FactoryGirl.attributes_for(:resume)
        }.to change(@user.resumes,:count).by(1)
      end

      it 'redirects to :edit view for the created resume' do
        get :new
        expect(response).to redirect_to [:edit, @user.resumes.last]
      end
    end
  end

  describe 'GET #edit' do
    before(:each) do 
      @resume = @user.resumes.create_with_associations
    end

    it 'renders :edit view' do
      get :edit, id: @resume
      expect(response).to render_template :edit
    end

    it 'returns requested resume' do
      get :edit, id: @resume
      assigns(:resume).should eq(@resume)
    end
  end

  describe 'PUT/PATCH #update' do
    it 'returns requested resume' do
      resume = @user.resumes.create
      patch :update, id: resume, resume: FactoryGirl.attributes_for(:resume)
      assigns(:resume).should eq(resume)
    end

    it 'updates attributes of the requested resume' do
      resume = @user.resumes.create(title: 'test')
      params = FactoryGirl.attributes_for(:resume)
      patch :update, id: resume, resume: params
      resume.reload
      expect(resume.title).to eq(params[:title])
    end

    it 'responds to .js' do
      resume = @user.resumes.create(title: 'test')
      put :update, id: resume, resume: FactoryGirl.attributes_for(:resume), format: :js
      expect(response.status).to be 200
    end

    it 'redirects to :show view for updated resume' do
      resume = @user.resumes.create(title: 'test')
      put :update, id: resume, resume: FactoryGirl.attributes_for(:resume)
      resume.reload
      expect(response).to redirect_to resume
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do 
      @resume = @user.resumes.create_with_associations
    end

    it 'destroys requested resume' do
      expect{
        delete :destroy, id: @resume
        }.to change(@user.resumes, :count).by(-1)
    end

    it 'redirects to users_dashboard_path' do
      delete :destroy, id: @resume
      expect(response).to redirect_to users_dashboard_path
    end
  end
end
