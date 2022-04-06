# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Alvarez Saul' }
    username { 'canelo' }
    email { 'canelo@boxing.mx' }
    password { 'alvarez112' }
  end
end
