provider "aws" {
    region = var.region
}

resource "aws_key_pair" "jisoo_key" {
    key_name = var.key
#    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDetQPke/ktPCjDIWqMPOYezoPM3S/Umn0m5/Xpv1t2LNQHk+6ni0aXi9DUKu6ffhL+y6EMkYVYXVupq+P8klRGYJdc+ZnCkKwXv4L+nTNaSbGJlrcViNspeoe6MNnHpWOT3vUQ5BSzp7VJKuFvwRT4r7QwEZy6EjBH92nALwbU0OjIHvTmLTEJdTLadAv/jqLHmL7+mds35rLC2t7BaPhD0hpaqT5afiqmaYh/YpQ38YQcKzQZ/gtAwgcu1pW6SH7Br9WXnwQfWFdeVvJiM/nh9LadHhlSujMzu7tb4+OTsG7sXIfp67foAExTNaP3KZgPkLrYJ+GByqtnOz5Kq7i4ECYJJpgKhTN6U1OaROH4OzrpbeiOGHLYHCVhsGgL/ilSFXU15tmz1MaqOVCSysSG/2ScxzE53UJMq7VHRhheiqZ7Q3p9UIrc7BmvwUQ+Pc626J2v7D3c0UWwgMChF5FBc+GSWjVqXWsHXIu3C/oag9FBIMP52o1d8ORzPivx73E="
    public_key = file("../../.ssh/jisoo-key.pub")
}

resource "aws_vpc" "jisoo_vpc" {
    cidr_block = var.cidr_main
    tags = {
      "Name" = "${var.name}-VPC"
    }
}

# 가용영역 public subnet
resource "aws_subnet" "jisoo_pub" {
  count = length(var.cidr_public) #2
  vpc_id = aws_vpc.jisoo_vpc.id
  cidr_block = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
}

# 가용영역 private subnet
resource "aws_subnet" "jisoo_pri" {
  count = length(var.cidr_private)  #2
  vpc_id = aws_vpc.jisoo_vpc.id
  cidr_block = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava[count.index]}"
  }
}

# 가용영역 private DB subnet
resource "aws_subnet" "jisoo_pridb" {
  count = length(var.cidr_privatedb)
  vpc_id = aws_vpc.jisoo_vpc.id
  cidr_block = var.cidr_privatedb[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pridb${var.ava[count.index]}"
  }
}



