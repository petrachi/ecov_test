require 'rails_helper'

RSpec.describe Publisher do
  it "publish a message" do
    conn = Bunny.new("amqp://rabbitmq:5672")
    conn.start

    channel = conn.create_channel
    fanout = channel.fanout("ecov_test.some_channel")

    queue = channel.queue("publisher_test", :auto_delete => true).bind(fanout)
    queue.subscribe do |delivery_info, properties, payload|
      @message_published = "#{queue.name} received a message: #{payload}"
    end

    Publisher.publish("some_channel", {key1: "one", key2: "two"})
    sleep(0.5)
    expect(@message_published).to eq('publisher_test received a message: {"key1":"one","key2":"two"}')
  end
end
