# frozen_string_literal: true

module V1
  module Entities
    class Job < Grape::Entity
      expose :id
      expose :title
      expose :description
      expose :role
      expose :salary
      expose :draft_mode
      expose :user_id
    end
  end
end