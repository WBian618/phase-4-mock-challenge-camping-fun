class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, includes: :activities

    rescue ActiveRecord::RecordNotFound
        render json: {'error': "camper not found"}, status: :not_found
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper

    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private
    def camper_params
        params.permit(:name, :age)
        
    end
end
