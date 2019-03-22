class RxformsController < ApplicationController
    def show
        rxform = Rxform.find params[:case]
        render json: rxform
    end

    def create
        rxform = Rxform.new(rxform_params)
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

    def case_submitted_email
        case_number = params[:case].to_i
        CaseSubmittedMailer.case_submitted_email(case_number).deliver_now
        render json: case_number, status: 200
    end

    def lab_email
      case_number = params[:case].to_i
      LabMailer.lab_email(case_number).deliver_now
      render json: case_number, status: 200
    end

    def alt_src_email
      case_number = params[:case].to_i
      AltSrcMailer.alt_src_email(case_number).deliver_now
      render json: case_number, status: 200
    end

    def alt_source_lab_email
      id = params[:id].to_i
      AltSourceLabMailer.alt_source_lab_email(id).deliver_now
      render json: id, status: 200
    end

    def alt_source_dentist_email
      id = params[:id].to_i
      AltSourceDentistMailer.alt_source_dentist_email(id).deliver_now
      render json: id, status: 200
    end

    private
    def rxform_params
        params.require(:rxform).permit(:serviceType, :doctor, :case, :address, :phone, :patient, :toothSupportedGuide, :tissueLevelGuide,
                       :boneReductionGuide, :boneLevelGuide, :hasStl, :maxillary, :mandibular, :numberOfImplants,
                       :anchorPins, :implantLocations, :implantSystem, :guidedSurgerySystem, :comment,
                       :user_id)
    end
end
