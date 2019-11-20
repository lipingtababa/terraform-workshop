resource "huaweicloud_blockstorage_volume_v2" "workshop-staging-docker" {
  region = var.region
  name = "docker"
  description = "docker"
  size = 200
}

resource "huaweicloud_blockstorage_volume_v2" "workshop-staging-qpackage" {
  region = var.region
  name = "qpackage"
  description = "qpackage"
  size = 500
}

resource "huaweicloud_compute_volume_attach_v2" "workshop-staging-docker" {
  instance_id = "${huaweicloud_compute_instance_v2.workshop-staging.id}"
  volume_id   = "${huaweicloud_blockstorage_volume_v2.workshop-staging-docker.id}"
}

resource "huaweicloud_compute_volume_attach_v2" "workshop-staging-qpackage" {
  instance_id = "${huaweicloud_compute_instance_v2.workshop-staging.id}"
  volume_id   = "${huaweicloud_blockstorage_volume_v2.workshop-staging-qpackage.id}"
}

resource "huaweicloud_vpc_v1" "vpc" {
  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"
}

resource "huaweicloud_compute_instance_v2" "workshop-staging" {
  name              = "workshop-staging"
  availability_zone = "AZ1"
  image_id = var.ami_id
  flavor_name = "c3.large.4"
  security_groups = ["default"]

  network {
    name = "${huaweicloud_vpc_v1.vpc.name}"
  }

  depends_on = [huaweicloud_vpc_v1.vpc]
}
