class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find(params[:id])
    activity.destroy
    render json: {}

    head :no_content

    rescue ActiveRecord::RecordNotFound
        render json: {'error': "activity not found"}, status: :not_found
    end
end
