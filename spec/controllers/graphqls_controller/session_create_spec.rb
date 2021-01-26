require 'rails_helper'

RSpec.describe GraphqlsController, type: :controller do
  let(:password) { FFaker::Internet.password }
  let(:user) { create :user, password: password }

  describe 'POST #create' do
    let(:mutation) do
      '
        mutation($email: String!, $password: String!) {
          sessionCreate(input: {
            email: $email,
            password: $password,
          }) {
            user {
              id,
              email
            },
            token
          }
        }
      '
    end

    context 'fail' do
      context 'user not found' do
        let(:variables) do
          {
            email: FFaker::Internet.email,
            password: FFaker::Internet.password
          }
        end

        before { post :create, params: { query: mutation, variables: variables } }

        it 'has errors' do
          expect(response).to match_schema(CreateSessionSchema::NotFound)
          expect(response).to be_ok
        end
      end

      context 'wrong password' do
        let(:variables) do
          {
            email: user.email,
            password: FFaker::Internet.password
          }
        end

        before { post :create, params: { query: mutation, variables: variables } }

        it 'has errors' do
          expect(response).to match_schema(CreateSessionSchema::WrongPassword)
          expect(response).to be_ok
        end
      end
    end

    context 'success' do
      let(:variables) do
        {
          email: user.email,
          password: password
        }
      end

      before { post :create, params: { query: mutation, variables: variables } }

      it 'create session' do
        expect(response).to match_schema(CreateSessionSchema::Success)
        expect(response).to be_ok
      end
    end
  end
end
