/*GATEWAY-API-CONFIG*/

# Resource: Regional Proxy-Only Subnet (Required for Regional Application Load Balancer)
resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name             = "proxify"
  region           = var.network-det.region
  ip_cidr_range    = "10.176.0.0/24"
  purpose          = "REGIONAL_MANAGED_PROXY"
  network          = var.network-det.name
  role             = "ACTIVE"

depends_on = [ module.network ]
}

output "regional_proxy_subnet_id" {
  description = "Regional Proxy Subnet ID"
  value = google_compute_subnetwork.regional_proxy_subnet.id 
}
#>>>