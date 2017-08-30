class UploadSyllabusesJob < ApplicationJob
  queue_as :default

    def perform(*args)
        kid, title, content, link, orig, token, path, content_type, position = args
        Azure::Storage.setup(:storage_account_name => 'railsclass', :storage_access_key => '2GrQJnBZIu3UDcgha9MAqmlRxkeqDfzWu1K3VqDc718ze6Wv0KmQzDlE0Y9KTqhU34j2qQLr1OVHkJsF/9udew==')
        blob = Azure::Storage::Blob::BlobService.new
        binary = ::File.open(path, 'rb'){|file| file.read}
        host = 'https://railsclass.blob.core.windows.net/classuploads'
        relative = "#{token}/#{orig}"
        absolute = "#{host}/#{relative}"
        blob.create_block_blob('classuploads', relative, binary, {content_type: content_type})
        ap Section.create!(klass_id: kid, title: title, content: content, link: link, azure: absolute, position: position)
      end
  
  # def perform(*args)
  #   p '*************************'
  #   p 'hello from my sidekiq job'
  #   p args
  #   name, secure = args
  #   Azure::Storage.setup(:storage_account_name => 'railsclass', :storage_access_key => '2GrQJnBZIu3UDcgha9MAqmlRxkeqDfzWu1K3VqDc718ze6Wv0KmQzDlE0Y9KTqhU34j2qQLr1OVHkJsF/9udew==')
  #   blob = Azure::Storage::Blob::BlobService.new
  #   content = ::File.open(secure, 'rb'){|f| f.read}
  #   host = 'https://railsclass.blob.core.windows.net/classuploads'
  #   azurepath = "#{SecureRandom.hex(64)}/#{name}"
  #   url = "#{host}/#{azurepath}"
  #   blob.create_block_blob('classuploads', azurepath, content)
  #   #Photo.create!(name: 'dontcare', azure: url)
  # end
  
end
