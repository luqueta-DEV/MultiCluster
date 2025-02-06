equire 'aws-sdk-s3'


s3_client = Aws::S3::Client.new(
  region: 'us-east-1',
  access_key_id: 'SUA_ACCESS_KEY',
  secret_access_key: 'SUA_SECRET_KEY'
)

bucket_name = 'meu-bucket-s3'


def list_objects(s3_client, bucket_name)
  puts "Listando objetos no bucket #{bucket_name}:"
  s3_client.list_objects_v2(bucket: bucket_name).contents.each do |object|
    puts object.key
  end
end


def upload_file(s3_client, bucket_name, file_path, key)
    s3_client.put_object (
        bucket: bucket_name
        key: key
        body: File.read(file_path)
    )
    puts 'arquivo #{file_path} enviado como #{key}.'
end

def download_file(s3_client, bucket_name, key, download_path)
    s3_client.get_object {
     bucket: bucket_name
     key: key
     response_target: download_path   
    }
    puts 'arquivo #key{key} foi baixado para {download_path}.'
end
   
