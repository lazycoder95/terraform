provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "pro-test" {
  instance_type = "t2.micro"
  key_name = "tf"
  ami = "ami-038bba9a164eb3dc1"
  vpc_security_group_ids = ["sg-085cdf0257ce6494a"]

  connection{
    type = "ssh"
    user = "ec2-user"
    private_key = file("./tf.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "uname"
     ]
    
  }
}
