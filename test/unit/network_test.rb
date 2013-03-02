require 'test_helper'

class NetworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ip validation" do
      assert Network.validate_ip('192.168.13.23')
  end

  test "ip validation of wrong ip" do
      assert !Network.validate_ip('Hi body!')
  end

  test "ip validation of wrong ip with exceeded numbers" do
      assert !Network.validate_ip('220.156.257.12')
  end

  test "ip to number conversation" do
      numeric = Network.ip2num('192.168.0.0')
      num = 192*2**24 + 168*2**16
      assert numeric == num, "Returned number #{numeric} should be #{num}"
  end

  test "ip to number conversation with nil" do
      numeric = Network.ip2num(nil)
      assert numeric.nil?
  end

  test "number to ip conversation" do
      num = 172*2**24 + 23*2**16 + 10*2**8 + 15
      numeric = Network.num2ip(num)
      assert numeric == '172.23.10.15', "Returned ip #{numeric} should be 172.23.10.15"
  end

  test "saving with correct ip" do
      n = Network.new
      n.start_ip = '192.168.1.2'
      n.end_ip = '192.168.1.56'
      assert n.save
  end
end
