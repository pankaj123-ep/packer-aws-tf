provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

/*
variable "ami-name"{

    default = "pakumar"
}

locals{

    
    raw_data     = jsondecode(file("${path.module}/build/manifest.json"))
    ami_idd = local.raw_data.builds[*].artifact_id
    }
/*
data "template_file" "packer_variable_input"{

template = "${file("${path.module}/sources.pkr.hcl")}"
vars ={
  
  ami_name= var.ami-name

}}
*/



resource "null_resource" "execute-packer" {
 
  provisioner "local-exec" {
    command = "cd build  && packer build ."
     }
   
}

resource "null_resource" "fetch_amiID" {
    depends_on = [
      null_resource.execute-packer
    ]
    
    provisioner "local-exec" {

        command = "echo getting ami id"
        
        
      
    }
}
