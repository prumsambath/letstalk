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
end
