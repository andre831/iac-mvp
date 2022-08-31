provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "key-cpu-test" {
  key_name   = "key-cpu-test"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCT4oN68V8qJFPLt68svs4lJaEpw+e3G/+sWOUFl86Sv6o8zoDfetT89ZIiTR0bGPjy7kE4bkO78h/ACFxT9dbFSpItvbfHjYlYghFbNYnRXbSwOp9HupqSBWwJpYjIQ+23d7W2axTaRjfcvsvzi9MSVCCgqMjjEq7n+7CT3ni9y7l5IRa7jBChSPVhxQXlmTLwsReOTlvTFiuDE/zcQW7VyUtGcQdoF5o0zKhUJrX53OGY8WtMdBkM56DQNk95LoXMCTJim0AyVt6QUJSnOi5KoRX2WO8gPGmjpcarvb53BtMGcwAXRg2Srkop19hpNEioZng0+DONDD3dBsMqkG1Mooj1Lm7HpmifwL+RXDDCf5HG+taj+LLb+MYMr/1HJ+HOabSS5F1lZv0y085I4D3F1ZqmRB2Bz5W4JshPSMahPx/IiQ+esk7ipnzPnC3E9NUBa6vb2wpCYDu/4tEg2lSX/FTpaSa56jaahEeHx9bFZFdYaZsKrIXRNDb1VvhP2w8= andre@andre-machine"
}

resource "aws_security_group" "cpu-test-sg" {
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "cpu-test" {
  ami           = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"
  key_name      = "key-cpu-test"
  count         = 1
  tags = {
    "name" = "cpu-ubuntu"
    "type" = "main"
  }

  security_groups = ["${aws_security_group.cpu-test-sg.name}"]
}