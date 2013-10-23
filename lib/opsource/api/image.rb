module Opsource::API
  class Image < Core
    def list_server_images
      endpoint '/base/image'
      get
    end

    def list_deployed_customer_images
      endpoint "/#{org_id}/image/deployed"
      get
    end
  end
end