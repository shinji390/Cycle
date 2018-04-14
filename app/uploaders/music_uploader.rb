require 'streamio-ffmpeg'
class MusicUploader < CarrierWave::Uploader::Base
  storage :fog

  def extension_whitelist
    %w(wav mp3)
  end

end
