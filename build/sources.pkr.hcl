/*data "amazon-ami" "basic-example" {
    filters = {
        virtualization-type = "hvm"
        name = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
        root-device-type = "ebs"
    }
    owners = ["099720109477"]
    most_recent = true
} */



source "amazon-ebs" "basic-example" {
  profile = "${var.profile}"
  region     = "${var.region}"  
  source_ami_filter {
    filters = {
       virtualization-type = "hvm"
       name = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
       root-device-type = "ebs"
    }
    owners = ["099720109477"] //aws-ami provider
    most_recent = true
    
  
  }
  force_deregister = true
  instance_type =  "t2.micro"
  ssh_username  =  "ubuntu"
  ami_name      =  "${var.ami_name}-packer_AWS_example_{{timestamp}}"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-DEMO-${var.ami_name}"
  }
}



