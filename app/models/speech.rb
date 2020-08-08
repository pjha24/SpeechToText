# Imports the Google Cloud client library
require "google/cloud/speech"
class Speech
  def initialize
    # Instantiates a client
    @speech = Google::Cloud::Speech.speech
  end
    def translate(url)
      # The name of the audio file to transcribe
      file_name = url
      
      # The raw audio
      audio_file = File.binread file_name

      # The audio file's encoding and sample rate
      config = { encoding:          :LINEAR16,
                #sample_rate_hertz: 48_000,
                language_code:     "en-US" }
      audio  = { content: audio_file }

      # Detects speech in the audio file
      response = @speech.recognize config: config, audio: audio

      results = response.results

      # Get first result because we only processed a single audio file
      # Each result represents a consecutive portion of the audio
      results.first.alternatives.each do |alternatives|
        puts "Transcription: #{alternatives.transcript}"
      end
  end
end