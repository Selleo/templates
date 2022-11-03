# Snippets for cloud init


## Mounting volume in user data:

main.tf:
```tf
resource "aws_ebs_volume" "retool_data" {
  availability_zone = "${var.region}a"
  size              = 60
  encrypted         = true
  type              = "standard"
}

resource "aws_volume_attachment" "retool_data" {
  device_name = "/dev/sdf" # aws will mount as /dev/nvme1n1 anyway
  volume_id   = aws_ebs_volume.retool_data.id
  instance_id = aws_instance.retool.id
}

data "cloudinit_config" "retool" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "init.yml"
    content_type = "text/cloud-config"
    content = templatefile("./tpl/cloudinit.yml", {
      mount_device = "/dev/nvme1n1"
      mount_point  = "/mnt/data"
      mount_fstype = "xfs"
    })
  }
}

```


tpl/cloudinit.yml:
```yaml
bootcmd:
  - [ mkdir, -p, "${mount_point}" ]
  - [ mount, -t, "${mount_fstype}", "${mount_device}", "${mount_point}"]
```


ssh to machine and do:
```sh
sudo mkfs -t xfs /dev/nvme1n1
```
