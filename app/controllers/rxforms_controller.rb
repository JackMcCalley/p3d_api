class RxformsController < ApplicationController
    def show
        rxform = Rxform.find params[:case]
        render json: rxform
    end

    def create
        rxform =Rxform.new(rxform_params)
        if rxform.save
            render json: rxform, status: 201
        else
          render json: {errors: user.errors}, status: 422
        end
    end

    def rxform_by_case_number
        case_number = params[:case]
        @rxform = Rxform.where(case: case_number)
        render json: @rxform, status: 200
    end

    private
    def rxform_params
        params.require(:rxform).permit(:serviceType, :doctor, :case, :address, :phone, :patient, :toothSupportedGuide, :tissueLevelGuide,
                       :boneReductionGuide, :boneLevelGuide, :hasStl, :maxillary, :mandibular, :numberOfImplants,
                       :anchorPins, :implantLocations, :implantSystem, :guidedSurgerySystem, :comment,
                       :user_id)
    end
end
