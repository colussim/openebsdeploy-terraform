
resource "kubernetes_namespace" "openebs-namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "epc_openebs" {
  name       = "epc-openebs"
  repository = "https://openebs.github.io/charts"
  chart      = "openebs"
  version    = "2.8.0"
  namespace  = var.namespace

	set {
                name  = "ndm.filters.excludePaths"
                value = "/dev/loop /dev/fd0 /dev/sr0 /dev/ram /dev/dm-1 "
                type  = "string"
        }




}


