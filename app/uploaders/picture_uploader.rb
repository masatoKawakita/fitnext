class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

    # デフォルト画像は700x700に収まるようリサイズ
  process :resize_to_limit => [700, 700]

    # サムネイル画像
  version :thumb do
    process resize_to_fill: [100, 100]
  end

    # 許可する画像の拡張子
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
    "/no_avatar.png"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
