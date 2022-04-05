# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  %i[name username email password_digest].each do |field|
    it { is_expected.to(have_field(field).of_type(String)) }
  end  
end
