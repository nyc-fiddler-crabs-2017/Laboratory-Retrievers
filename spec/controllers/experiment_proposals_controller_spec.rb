require 'rails_helper'

describe ExperimentProposalsController do
  let!(:proposal) { ExperimentProposal.create!(title: "MY EXP", summary: "make shit work", hypothesis: "it will work", user_id: 1) }

  describe "GET experiment_proposals#new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

end
