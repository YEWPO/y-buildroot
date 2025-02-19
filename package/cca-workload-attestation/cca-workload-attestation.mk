################################################################################
#
# CCA Workload Attestation PoC
#
################################################################################

CCA_WORKLOAD_ATTESTATION_VERSION = d28525f2100e3c0683e6246a84208a9a141120be
CCA_WORKLOAD_ATTESTATION_SITE = https://git.codelinaro.org/linaro/dcap/cca-demos/cca-workload-attestation-poc.git
CCA_WORKLOAD_ATTESTATION_SITE_METHOD = git
CCA_WORKLOAD_ATTESTATION_LICENSE = BSD 3-Clause
CCA_WORKLOAD_ATTESTATION_LICENSE_FILES = LICENSE

CCA_WORKLOAD_ATTESTATION_GOMOD = git.codelinaro.org/linaro/dcap/cca-demos/cca-workload-attestation-poc

# Uncomment the next two lines for a statically linked application
#CCA_WORKLOAD_ATTESTATION_GO_ENV = CGO_ENABLED=0 GOARCH=arm64 GOOS=linux
#CCA_WORKLOAD_ATTESTATION_LDFLAGS = -s -w
#CCA_WORKLOAD_ATTESTATION_GO_ENV = GOFLAGS=-mod=mod

$(eval $(golang-package))
