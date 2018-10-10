class DicomfilesController < ApplicationController
    has_one_attached :dicomfile
    validates :filename, presence: true
    belongs_to :user

    def index
        dicomfiles = Dicomfile.all
        render json: dicomfiles
    end

    def create
        dicomfile = Dicomfile.create(dicomfile_params)
        if dicomfile.valid?
            render json: dicomfile
           else
             render json: dicomfile.errors, status: :unprocessable_entity
           end
    end

    def dicomfile_params
        params.require(:dicomfile).permit(:filename, :uploader, :paid)
end
