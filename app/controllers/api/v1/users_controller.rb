module Api
  module V1
    class UsersController < ApplicationController

      def index
        run User::Operation::List

        render json: @model
      end

      def update

      end

      def create
        run User::Operation::Create

        render json: @model
      end
    end
  end
end
