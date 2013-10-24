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
  end
end