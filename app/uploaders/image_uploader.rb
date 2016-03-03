# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Rails.root}uploads/#{model.user.name.downcase.tr(" ", "_")}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

   version :landscape_gallery, if: :is_landscape? do
       process resize_to_fill: [720, 539]
     end
    
    version :portrait_gallery, if: :is_portrait? do
      process resize_to_fit: [539, 720]
    end
    
    version :normal do
      process resize_to_fill: [196, 142]
    end
    
    version :thumb, from: :normal do
      process resize_to_fill: [90, 90]
    end
    
    def is_landscape? picture
      image = MiniMagick::Image.open(picture.path)
      image[:width] > image[:height]
    end
    
    def is_portrait? picture
      image = MiniMagick::Image.open(picture.path)
      image[:height] > image[:width]
    end
    

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
