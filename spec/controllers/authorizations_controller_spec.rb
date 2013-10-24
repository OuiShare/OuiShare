require 'spec_helper'

describe AuthorizationsController do
  let(:user) { User.make! }
  let(:authorization) { Authorization.make! user: user }

  context 'Not authenticated' do
    before { delete :destroy, id: authorization.id }
    it { expect(response).to redirect_to(new_user_session_path) }
    it { expect(-> { authorization.reload }).not_to raise_error(ActiveRecord::RecordNotFound) }
  end

  context 'Authenticated' do
    before do
      sign_in user
      delete :destroy, id: authorization.id
    end

    it { expect(response).to redirect_to(edit_user_registration_url) }
    it { expect(-> { authorization.reload }).to raise_error(ActiveRecord::RecordNotFound) }
  end
end
