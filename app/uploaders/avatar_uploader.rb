class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog
  process resize_to_fill: [100, 100, gravity = 'Center']

  def extension_whitelist
    %w(jpg jpeg png)
  end

end
