class StlfilesController < ApplicationController
    has_one_attached :stlfile
    validates :filename, presence: true
    belongs_to :user

    def index
        stlfiles = Stlfile.all
        render json: stlfiles
    end

    def create
        stlfile = Stlfile.create(stlfile_params)
        if stlfile.valid?
            render json: stlfile
           else
             render json: stlfile.errors, status: :unprocessable_entity
           end
    end

    def stlfile_params
        params.require(:stlfile).permit(:filename, :uploader, :paid)
end
