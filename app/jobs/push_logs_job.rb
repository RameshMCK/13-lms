class PushLogsJob < ApplicationJob
  queue_as :default

       def perform(*args)
        
        data  = args.first
        ###binding.pry
        HTTParty.post('http://localhost:8082/logs', {body: {log: data}})

      end

end
