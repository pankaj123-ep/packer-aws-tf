build {

  name = "ubuntu-ami-build"
  sources = ["source.amazon-ebs.basic-example"]

    provisioner "shell" {
    # This runs with all sources.
        inline = [
        "echo $pwd"
      ]
  }
  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
}