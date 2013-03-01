require 'test_helper'

class NetworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "ip to number conversation" do
      numeric = Network.ip2num('192.168.0.0')
      num = 192*2**24 + 168*2**16 + 0 + 0
      assert numeric == num, "Returned number #{numeric} should be #{num}"
  end

  test "ip to number conversation with nil" do
      numeric = Network.ip2num(nil)
      assert numeric.nil?
  end

  test "number to ip conversation" do
      pending "implement this part"
      assert true
  end
end
