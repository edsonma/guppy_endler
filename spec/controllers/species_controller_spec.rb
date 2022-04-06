# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(SpeciesController, type: :controller) do
  let!(:guppy) { create(:specie, name: 'Guppy Endlers') }
  let!(:kanei) { create(:specie, name: 'Corydora Kanei') }
  let!(:maskarade) { create(:specie, name: 'Corydora Maskarade') }

  describe 'GET #index' do
    subject { get :index }

    it 'assigns all species' do
      subject

      expect(response).to(have_http_status(:success))
      expect(assigns(:species).count).to(eq(3))
    end
  end

  describe 'GET #show' do
    let(:tetra_neon) { create(:specie, name: 'Tetra Neons') }

    subject { get :show, params: { id: tetra_neon } }

    it 'assigns tetra_neon to instance var' do
      subject

      expect(response).to(have_http_status(:success))
      expect(assigns(:specie)).to(eq(tetra_neon))
    end
  end
end
