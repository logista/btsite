require 'mini_magick'

module Jekyll
  class TozierPicserizer < Generator
    def generate(site)

      src = site.config["picserizer"]["source"]
      source_dir = File.join(site.source,src)
      Dir.chdir(source_dir)
      all_subdirectories = Dir.glob("*").find_all {|i| File.directory?(i)}
      sizes = site.config["picserizer"]["sizes"]
      target_dir = File.join(site.source,site.config["picserizer"]["target"])

      all_subdirectories.each do |subdir|
        source_pictures = Dir.glob("#{source_dir}/#{subdir}/*.jpg")

        sizes.each do |size|
          full_target_path = "#{target_dir}/#{subdir}/#{size.to_s}"
          if Dir.exist?(full_target_path)
            # puts "I found #{full_target_path}!"
          else
            Dir.mkdir(full_target_path)
          end

          source_pictures.each do |pic_name|
            new_name = full_target_path + "/" + File.basename(pic_name)
            if File.exist?(new_name)
              # puts "There's already a #{new_name}!"
            else
              loaded_pic = MiniMagick::Image.open(pic_name)
              loaded_pic.resize size.to_s
              loaded_pic.format "jpg"
              loaded_pic.write(new_name)
            end
          end
        end
      end
    end
  end
end
