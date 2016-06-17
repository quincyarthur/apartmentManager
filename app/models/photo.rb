class Photo < ActiveRecord::Base
  belongs_to :property, polymorphic: true
  has_attached_file :image, 
	:path => ":rails_root/public/images/:id/:filename",
	:url => "/images/:id/:filename",
	:styles => {
  		:thumb    => ['100x100#',  :jpg, :quality => 70],
  		:preview  => ['480x480#',  :jpg, :quality => 70],
  		:large    => ['600>',      :jpg, :quality => 70],
  		:retina   => ['1200>',     :jpg, :quality => 30]
	},
	:convert_options => {
  		:thumb    => '-set colorspace sRGB -strip',
  		:preview  => '-set colorspace sRGB -strip',
  		:large    => '-set colorspace sRGB -strip',
  		:retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	}
	#validations
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/jpg", "image/png"] }
end
