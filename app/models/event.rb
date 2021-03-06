class Event < ApplicationRecord
	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png",         
	:storage => :s3,                    
	:url => 's3_domain_url',            
	:s3_host_alias => 'goodmuse.s3-website-us-east-1.amazonaws.com',  
	:path => "/:class/:attachment/:id_partition/:style/:filename"
	
	has_attached_file :avatar2, :styles => { :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png",         
	:storage => :s3,                    
	:url => 's3_domain_url',            
	:s3_host_alias => 'goodmuse.s3-website-us-east-1.amazonaws.com',  
	:path => "/:class/:attachment/:id_partition/:style/:filename"
	

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates_attachment_content_type :avatar2, :content_type => /\Aimage\/.*\Z/

	has_and_belongs_to_many :playlists
	belongs_to :user
	belongs_to :genre_event, optional: true
	has_many :going_statuses


	def image_url    
		if self.avatar.present?    
			path = URI.parse(URI.encode(self.avatar.url.to_s))
			path = "http:" + path.to_s
		else
			""
		end 
	end

	def image_2_url    
		if self.avatar2.present?    
			path = URI.parse(URI.encode(self.avatar2.url.to_s))
			path = "http:" + path.to_s
		else
			""
		end 
	end

	def is_going(user_id)
		gong_statusa = GoingStatus.find_by(event_id: self.id, user_id: user_id)
		if gong_statusa.present?
			gong_statusa.going_status
		else
			false
		end
	end


end
