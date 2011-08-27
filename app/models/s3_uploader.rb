class S3Uploader
  def self.upload(filename, data)
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

end
