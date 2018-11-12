# Code mostly from https://prograils.com/posts/rails-5-2-active-storage-new-approach-to-file-uploads

class ImageResizer
  class << self
    def jpeg?(blob)
      blob.content_type.include? "jpeg"
    end

    def optimize
      {
        strip: true
      }
    end

    def optimize_jpeg
      {
        strip: true,
        'sampling-factor': "4:2:0",
        quality: "85",
        interlace: "JPEG",
        colorspace: "sRGB"
      }
    end

    def optimize_hash(blob)
      return optimize_jpeg if jpeg? blob
      optimize
    end

    def resize_on_bigger_size(max_area:, blob:)
      blob.analyze unless blob.analyzed? && blob.metadata[:width].present?

      width = blob.metadata[:width].to_f
      height = blob.metadata[:height].to_f

      new_width = Math.sqrt(max_area * (width / height)).round
      new_height = Math.sqrt(max_area * (height / width)).round

      {
        resize: "#{new_width}x#{new_height}"
      }.merge(optimize_hash(blob))
    end
  end
end
