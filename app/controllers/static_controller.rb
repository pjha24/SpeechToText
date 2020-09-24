class StaticController < ApplicationController
	require 'base64'
	require 'tempfile'
    skip_before_action :verify_authenticity_token, only: [:save_file]

    def index
    end
    
    def translate
		@speech = Speech.new
		@audio = File.join(Rails.root, 'tmp', 'audio1.wav')
    end
	
	def save_file
		@audio = params[:audio]
		@save_path = Rails.root.join("tmp/audio1.wav")
		@audio.rewind
      # Open and write the file to file system.
      File.open(@save_path, 'wb') do |f|
        f.write params[:audio].read
      end

end
	
end
