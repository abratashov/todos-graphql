require 'rails_helper'

RSpec.describe GraphqlsController, type: :controller do
  let(:user) { create :user }

  describe 'POST #create' do
    let(:query) do
      '
        query {
          me {
            id
            email
          }
        }
      '
    end

    context 'unauthenticated' do
      before { post :create, params: { query: query } }

      it 'has errors' do
        expect(response).to match_schema(CurrentUserSchema::NotAuthenticated)
        expect(response).to be_ok
      end
    end

    context 'authenticated' do
      context 'success' do
        before do
          sign_in user
          post :create, params: { query: query }
        end

        it 'show user' do
          expect(response).to match_schema(CurrentUserSchema::Success)
          expect(response).to be_ok
        end
      end
    end
  end
end
