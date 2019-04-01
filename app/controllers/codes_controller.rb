class CodesController < ApplicationController
  def return_keys
    aws = Code.find(3)
    sak = Code.find(2)
    render json: [aws, sak], status: 201
  end
end
