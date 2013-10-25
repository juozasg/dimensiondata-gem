module Opsource::API
  class Image < Core
    def server_list
      endpoint '/base/image'
      get
    end

    def deployed_list
      endpoint "/#{org_id}/image/deployed"
      get
    end

    def show(image_id)
      endpoint "/#{org_id}/image/#{image_id}"
      get
    end
  end
end