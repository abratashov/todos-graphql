class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/attachment/#{mounted_as}/#{model.id}"
  end

  def asset_host
    Rails.application.credentials.asset_host
  end
end
