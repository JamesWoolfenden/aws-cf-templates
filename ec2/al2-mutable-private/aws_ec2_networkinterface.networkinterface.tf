resource "aws_network_interface" "NetworkInterface" {
  subnet_id         = ""
  ipv6_addresses    = []
  source_dest_check = false
}
