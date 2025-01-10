class PointsController < ApplicationController

    def index
        temp = Point.all
        render json: temp
    end

    def show
        person = nil
        if Point.exists?(params[:id])
            point = Point.find(params[:id])
        else
            point = {error: "not found"}
        end
        render json: point
    end

    def create
        temp = Point.new(point_post_param)
        res = nil
        if !temp.save
            render json: {error: "issue in creating the object"}
            return
        end
        render json: temp
    end

    def update
        id = params[:id]
        patchValue = point_patch_param
        temp = Point.find_by(id: id)
        if temp == nil
            render json: {error: "this id does not exist"}
            return
        end
        if temp.update(patchValue)
            render json: temp
        else
            render json: {error: "issue in updating the person"}
        end
    end

    def destroy
        temp = Point.find_by(id: params[:id])
        if temp == nil
            render json: {error: "this id does not exist"}
            return
        end
        temp.destroy
        render json: {body: "done"}
    end

    
    private
    def point_post_param
        params.permit(:info,:critical_level,:commentable_type,:commentable_id)
    end
    def point_patch_param
        params.permit(:info,:critical_level)
    end
end
