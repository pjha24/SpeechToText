class StaticController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:translate]

    def index
    end
    
    def translate
        @speechs = Speech.new
        @audio = "Test-Recording4.wav"
    end
end
