resource "aws_key_pair" "deployer" {
  key_name = "deployer"
  public_key = "${file("c:/Users/rdeheer/.ssh/wordpress.pub")}"
}
