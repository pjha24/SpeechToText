class StaticController < ApplicationController
    def index
        @speech = Speech.new
    end
end
