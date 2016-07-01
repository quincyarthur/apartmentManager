class Photo < ActiveRecord::Base
  belongs_to :property, polymorphic: true
  has_attached_file :image, 
	:path => ":rails_root/public/images/:id/:filename",
	:url => "/images/:id/:filename",
	 styles: {
  		thumb: ["64x64#", :jpg], original: ['500x500>', :jpg],
       convert_options: { thumb: "-quality 75 -strip",
                          original: "-quality 85 -strip" 
                        }

	 }

  validates_attachment_content_type :image, content_type: /\Aimage/, message: 'Only Jpeg,png images permitted'
  # Validate filename
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  #do_not_validate_attachment_file_type :avatar

end