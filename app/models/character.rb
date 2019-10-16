class Character < ActiveRecord::Base

    has_attached_file :avatar,
                      :styles => {:profile => "512x512#"},
                      :url => "/system/:class/:attachment/:id/:style/:updated_at/:hash.:extension",
                      :default_url => "/images/heroes/missing_:style.jpg",
                      :hash_secret => Rails.application.secrets.secret_key_base,
                      :preserve_firl => "true"

                      validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png'], :message => "L'avatar doit être un png ou un jpeg"
                      validates_attachment_file_name :avatar, :matches => [/png\Z/i, /jpe?g\Z/i], :message => "L'avatar doit être un png ou un jpeg"
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end