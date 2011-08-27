class S3Uploader
  def self.upload(filename, data)
    establish_connection!
    AWS::S3::S3Object.store(filename, data, bucket_name,
                            :access => :public_read)
    AWS::S3::S3Object.url_for(filename, bucket_name,
                              :use_ssl => true,
                              :authenticated => false)
  end

  private
  def self.bucket_name
    "dreamforce11.dbcomdemo"
  end

  def self.establish_connection!
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ENV["AWS_KEY"] || "aws-key",
      :secret_access_key => ENV["AWS_SECRET"] || "aws-secret"
    )
  end

end
