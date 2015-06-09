require 'rails_helper'

describe EventsController do
  describe "GET #index" do
    it "populates all active events" do
      rails_event = create(:event)
      javascript_event = create(:event)

      get :index

      expect(assigns(:events)).to match_array([rails_event, javascript_event])
    end
  end

  describe "POST #crete" do
    context "with valid attributes" do
      it "saves the new event to the database" do
        expect {
          post :create, event: attributes_for(:event)
        }.to change(Event, :count).by(1)
      end
    end
  end
end
