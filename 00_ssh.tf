resource "aws_key_pair" "jisoo_key" {
    key_name = "jisoo2-key"
#    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDetQPke/ktPCjDIWqMPOYezoPM3S/Umn0m5/Xpv1t2LNQHk+6ni0aXi9DUKu6ffhL+y6EMkYVYXVupq+P8klRGYJdc+ZnCkKwXv4L+nTNaSbGJlrcViNspeoe6MNnHpWOT3vUQ5BSzp7VJKuFvwRT4r7QwEZy6EjBH92nALwbU0OjIHvTmLTEJdTLadAv/jqLHmL7+mds35rLC2t7BaPhD0hpaqT5afiqmaYh/YpQ38YQcKzQZ/gtAwgcu1pW6SH7Br9WXnwQfWFdeVvJiM/nh9LadHhlSujMzu7tb4+OTsG7sXIfp67foAExTNaP3KZgPkLrYJ+GByqtnOz5Kq7i4ECYJJpgKhTN6U1OaROH4OzrpbeiOGHLYHCVhsGgL/ilSFXU15tmz1MaqOVCSysSG/2ScxzE53UJMq7VHRhheiqZ7Q3p9UIrc7BmvwUQ+Pc626J2v7D3c0UWwgMChF5FBc+GSWjVqXWsHXIu3C/oag9FBIMP52o1d8ORzPivx73E="
    public_key = file("../../.ssh/jisoo-key.pub")
}