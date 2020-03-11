RSpec.describe "Users", type: :request do
  describe "GET /api/v1/users" do
    let!(:users)    { create_list(:user, 7) }
    let(:parsed_response) { JSON.parse(response.body) }
    let(:attributes_to_check) { [:id, :first_name, :last_name, :email] }

    before do
      get api_v1_users_path
    end

    it "returns 200" do
      expect(response).to have_http_status(200)
    end

    it "returns list of users" do
      parsed_response.each do |response_user|
        user = users.detect { |u| u.id == response_user["id"] }

        expect(user.first_name).to eq(response_user["first_name"])
        expect(user.last_name).to eq(response_user["last_name"])
        expect(user.email).to eq(response_user["email"])
      end
    end
  end

  describe "POST /api/v1/users" do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name)  { Faker::Name.last_name }
    let(:email)      { Faker::Internet.email }

    let(:params) {
      {
          user: {
              first_name: first_name,
              last_name:  last_name,
              email:      email
          }
      }
    }
    let(:call_endpoint) { post api_v1_users_path, params: params }


    it "returns 200" do
      call_endpoint
      expect(response).to have_http_status(200)
    end

    it "creates user" do
      expect { call_endpoint }.to change{
        User.where(
           first_name: first_name,
           last_name:  last_name,
           email:      email
        ).count
      }.by(1)
    end
  end
end
