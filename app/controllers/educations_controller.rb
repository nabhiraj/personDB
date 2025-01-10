class EducationsController < ApplicationController

    def create
        education = Education.new(education_param)
        if education.save
            render json: education
        else
            render json: {error: "unable to save the data"}
        end
    end

    def show
        education = Education.find_by(id: params[:id])
        if education
            render json: education
        else
            render json: {error: "unable to find the record"}
        end
    end

    def destroy
        begin
            education = Education.find_by(id: params[:id])
            if education
                education.destroy
                render json: {body:"data"}
            else
                render json: {error: "error is finding"}
            end
        rescue
            render json: {error: "error in deleteing the record"}
        end
    end

    def update
        education = Education.find_by(id: params[:id])
        if !education
            render json: {error:"error in finding the record"}
            return
        end
        education.update(education_param)
        render json: education
    end

    private 
    def education_param
        params.permit(:degree,:description,:description,:start_date,:end_date,:currently_studing,:institute_info,:city,:marks_scored,:marks_total,:person_id)
    end
end