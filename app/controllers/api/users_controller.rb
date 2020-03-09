module Api
  class UsersController < ApplicationController

    def index
      run User::List

      render json: @model
    end

    def create
      run User::Create

      render json: @model
    end
  end
end
