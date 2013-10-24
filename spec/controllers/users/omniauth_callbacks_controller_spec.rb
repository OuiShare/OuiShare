require 'spec_helper'

describe Users::OmniauthCallbacksController do
  let(:user) { User.make! }
  let(:omniauth_attrs) do
    { 'provider' => 'facebook',
      'uid'      => '230470' }
  end

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'facebook' do
    before do
      controller.stub(:env).and_return('omniauth.auth' => omniauth_attrs)
    end

    context 'user signed in' do
      before do
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user)
      end

      it 'associates facebook with current account' do
        post :facebook
        expect(user.reload.authorizations.provider(:facebook)).to_not be_empty
      end

      it 'redirects to the last accessed page' do
        post :facebook
        expect(response).to redirect_to(root_path)
      end
    end

    context 'user not signed in' do
      before do
        controller.stub(:user_signed_in?).and_return(false)
      end

      context 'existing authorization' do
        before do
          Authorization.make!(provider: omniauth_attrs['provider'],
                              uid:      omniauth_attrs['uid'],
                              user:     user)
        end

        it 'signs user in' do
          begin
            controller.should_receive(:sign_in_and_redirect)
            post :facebook
          rescue ActionView::MissingTemplate
          end
        end
      end

      context 'inexistent authorization' do
        it 'redirects user to registration path' do
          post :facebook
          expect(response).to redirect_to(new_user_registration_path)
        end

        it 'stores omniauth attributes in HTTP session' do
          post :facebook
          expect(session[:omniauth]).to eql(omniauth_attrs)
        end
      end
    end
  end
end

