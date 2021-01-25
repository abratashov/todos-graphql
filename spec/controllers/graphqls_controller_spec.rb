require 'rails_helper'

RSpec.describe GraphqlsController, type: :controller do

  ######################################## Show ########################################

  describe 'POST #create' do
    let(:mutation) do
      '
        mutation($email: String!, $password: String!, $passwordConfirmation: String!) {
          userCreate(input: {
            email: $email,
            password: $password,
            passwordConfirmation: $passwordConfirmation
          }) {
            user {
              id,
              email
            },
            errors {
              messages,
              path
            }
          }
        }
      '
    end

    context 'fail' do
      context 'invalid params' do
        let(:variables) do
          {
            email: '',
            password: '',
            passwordConfirmation: ''
          }
        end

        before { post :create, params: { query: mutation, variables: variables } }

        it 'has errors' do
          expect(response).to match_schema(CreateUserSchema::Error)
          expect(response).to be_ok
        end
      end
    end

    context 'success' do
      let(:variables) do
        {
          email: FFaker::Internet.email,
          password: 'password',
          passwordConfirmation: 'password'
        }
      end

      before { post :create, params: { query: mutation, variables: variables } }

      it 'create session' do
        expect(response).to match_schema(CreateUserSchema::Success)
        expect(response).to be_ok
      end
    end
  end

  ######################################## Show ########################################

  describe 'POST #show' do
    let(:query) do
      '
        query($id: ID!) {
          user(id: $id) {
            id
            email
            createdAt
            updatedAt
          }
        }
      '
    end

    context 'fail' do
      context 'wrong user id' do
        let(:variables) do
          { id: 0 }
        end

        before { post :create, params: { query: query, variables: variables } }

        it 'has errors' do
          expect(response).to match_schema(ShowUserSchema::NotFound)
          expect(response).to be_ok
        end
      end
    end

    context 'success' do
      let(:user) { create(:user) }

      let(:variables) do
        { id: user.id }
      end

      before { post :create, params: { query: query, variables: variables } }

      it 'show user' do
        expect(response).to match_schema(ShowUserSchema::Success)
        expect(response).to be_ok
      end
    end
  end
end
