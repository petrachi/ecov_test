module Publisher
  def publish(exchange, message = {})
    channel.fanout("ecov_test.#{exchange}").publish(message.to_json)
  end

  def channel
    connection.create_channel
  end

  def connection
    Bunny.new("amqp://rabbitmq:5672").tap do |c|

      c.start
    end
  end

  extend self
end
