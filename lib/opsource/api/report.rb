module Opsource::API
    class Report < Core
        def auditlog(start_date, end_date)
            start = start_date.strftime("%Y-%m-%d")
            stop = end_date.strftime("%Y-%m-%d")
            org_endpoint "/auditlog?startDate=#{start}&endDate=#{stop}"
            get_simple
        end
    end
end
