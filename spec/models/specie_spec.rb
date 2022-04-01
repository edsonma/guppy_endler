# frozen_string_literal: true

# frozen_string_literal

require 'rails_helper'

RSpec.describe(Specie, type: :model) do
  it { is_expected.to(have_field(:name).of_type(String)) }
end
