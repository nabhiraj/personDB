class JobsController < ApplicationController
    
    def create
        data = job_params
        job = Job.new(data)
        if !job.save
            render json: {error: "unable to save the job information"}
            return
        end
        render json: job
    end

    def show
        temp = Job.find_by(id: params[:id])
        if temp
            render json: temp
        else
            render json: {error: "not able to find the required record"}
        end
    end

    def update
        job = Job.find_by(id: params[:id])
        if !job
            render json: {error:"error in finding the record"}
            return
        end
        job.update(job_params)
        render json: job
    end

    def destroy
        temp = Job.find_by(id: params[:id])
        if temp
            temp.destroy
            render json: {body: "done"}
        else
            render json: {error: "not able to find the required record"}
        end
    end

    private
    def job_params
        params.permit(:self_employed,:discription,:industry,:tittle,:employer_info,:start_date,:end_date,:currently_employed,:city,:person_id)
    end

end
