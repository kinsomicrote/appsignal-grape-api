# frozen_string_literal: true

module V1
  class Jobs < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    helpers do
      def user
        @user ||= User.find(params[:user_id])
      end

      def job
        @job ||= Job.find(params[:id])
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless user.id == job.user_id
      end
    end

    # rescue_from :all do |error|
    #   puts "An error occurred: Error #{error.inspect}"
    #   # Appsignal.set_error(error)
    #   error!({ error: error.message }, 500)
    # end

    resource :jobs do
      desc 'Return list of jobs'
      get do
        jobs = Job.all
        present jobs, with: Entities::Job
      end

      get "/error" do
        raise Exceptions::NotFound.new(message: "Something unexpected happened.......")
      end

      desc 'Filter jobs'
      params do
        optional :role, type: String
      end
      get 'filters' do
        jobs = Job.where("role ILIKE ?", "%" + params[:role] + "%")
        present jobs
      end

      desc 'Return a specific job'
      route_param :id, type: Integer do
        get do
          if job
            present job
          else
            error!('404 Not Found', 404)
          end
        end
      end

      desc 'Create a job'
      params do
        requires :title, type: String
        requires :description, type: String
        requires :role, type: JobRole, default: JobRole.new('full-time')
        requires :salary, type: String
        requires :user_id, type: Integer
      end
      post do
        job = Job.create({title: params[:title], description: params[:description], role: params[:role].role, salary: params[:salary], user_id: params[:user_id]})
        present job, with: Entities::Job
      end

      desc 'Update a job'
      params do
        optional :title, type: String
        optional :description, type: String
        optional :role, type: JobRole
        optional :salary, type: String
        requires :user_id, type: Integer
      end
      route_param :id, type: Integer do
        patch do
          authenticate!
          job.update(params.except!(:id, :user_id))
          present job, with: Entities::Job
        end
      end
    end
  end
end