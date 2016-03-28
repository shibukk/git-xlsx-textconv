#!/bin/bash

XC_ARCH=${XC_ARCH:-386 amd64}
XC_OS=${XC_OS:-linux darwin windows}

rm -rf pkg/
gox \
    -os="${XC_OS}" \
    -arch="${XC_ARCH}" \
    -output "pkg/{{.Dir}}_{{.OS}}_{{.Arch}}"

ghr ${1:-v1.0.0} pkg/
