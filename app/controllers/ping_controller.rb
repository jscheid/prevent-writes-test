class PingController < ActionController::Base
  def root
    render plain: "G'day!\n"
  end
  
  def ping
    result = ActiveRecord::Base.connection.execute(<<~SQL)
      UPDATE pings SET ping_count = ping_count + 1 RETURNING ping_count
    SQL
    result.first.symbolize_keys => { ping_count: }
    render plain: "You've pinged me #{ping_count} times!\n"
  end

  rescue_from StandardError do |err|
    STDERR.puts ([err.to_s] + err.backtrace).join("\n")
    render :plain => "Ping failed, an error occurred: #{err}", status: 500
  end  
end
