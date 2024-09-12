class LiveController < ActionController::Base
  include ActionController::Live

  def stream
    response.headers['X-Accel-Buffering'] = 'no'
    response.headers['Last-Modified'] = Time.now.httpdate
    response.headers['Content-Type'] = "text/plain"

    begin # Rails.application.executor.wrap do
      begin # ActiveRecord::Base.connection_pool.with_connection do
        ActiveRecord::Base.connected_to(
          role: :reading,
          prevent_writes: true,
        ) do
          (1..100).each do |n|
            response.stream.write("#{n}\n")
            sleep(1)
          end
        end
      end
    end
  rescue ActionController::Live::ClientDisconnected
    # ignore
  ensure
    response.stream.close
  end
end

