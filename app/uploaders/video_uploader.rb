require 'streamio-ffmpeg'
class VideoUploader < CarrierWave::Uploader::Base
  storage :fog

  def extension_whitelist
    %w(MOV wmv mp4)
  end

end
