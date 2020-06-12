class UtcTagController < ApplicationController
    def index
        @utcs = Utc.search(params[:term])
        render json: @utcs.map(&:value).uniq 
    end
end
