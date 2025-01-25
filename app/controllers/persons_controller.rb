class PersonsController < ApplicationController
    
    def index
        temp = Person.all
        render json: temp
    end

    def show
        person = nil
        if Person.exists?(params[:id])
            render json: get_person_with_points_and_relations(params[:id])
            return
        else
            render json: {error: "not found"}
        end
    end

    def create
        temp = Person.new(person_param)
        res = nil
        if !temp.save
            render json: {error: "issue in creating the object"}
            return
        end
        render json: temp
    end

    def update
        id = params[:id]
        patchValue = person_param
        temp = Person.find_by(id: id)
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
        temp = Person.find_by(id: params[:id])
        if temp == nil
            render json: {error: "this id does not exist"}
            return
        end
        temp.destroy
        render json: {body: "item destroyed"}
    end

    def create_and_relate
        begin
            Person.transaction do
                source_person_id = params[:sourcePerson]
                relation_kind = params[:relation]
                relativeInfo = person_param
                relative = Person.new(relativeInfo)
                if relative.save
                    relation = Relative.new({relation_name: relation_kind,person_1_id:source_person_id,person_2_id:relative.id})
                    if relation.save
                        render json: get_person_with_points_and_relations(source_person_id)
                        return
                    else
                        raise ActiveRecord::Rollback
                    end
                else
                    raise ActiveRecord::Rollback
                end
                render json: {error: "some error occured code.1"}
            end
        rescue
            render json: {error:"some error occured code.2"}
        end
    end

    def relate
        source_person_id = params[:id]
        relation_kind = params[:relation]
        relative_id = params[:relative_id]
        relation = Relative.new({relation_name: relation_kind,person_1_id:source_person_id,person_2_id:relative_id})
        if relation.save
            render json: get_person_with_points_and_relations(source_person_id)
            return
        end
        render json: {error: "some error occured"}
    end
    
    def exp
        begin
            puts "hellow world"
            puts view_context.asset_url('application.js')
            render json: {data: Rails.application.config.assets.paths} 
        rescue
            render json: {data: 'some exception ho gaya'}
        end
    end

    def expview
        puts "simply putting the view infront"
    end

    private
    def get_person_with_points_and_relations(source_person_id)
        Person.find_by(id:source_person_id).as_json(include: ["points","educations","jobs":{include: "points"},relatives: {include: {person_2:{include: :points}}}])
    end

    def person_param
        params.permit(:name,:height,:weight,:gotr,:skin_color,:hair_color,:handicap,:cronic_disease,:married,:gender,:date_of_birth,:mobile_number)
    end
end