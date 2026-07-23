FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:kommando-ipmi-card = " \
     file://pwm.cfg \
     file://pstore.cfg \
     file://aspeed-bmc-asus-kommando-ipmi-card.dts \
     file://v4-0001-dt-bindings-serial-8250-aspeed-add-compatible-str.patch \
     file://v4-0002-dt-bindings-serial-8250-aspeed-add-aspeed-vuart-o.patch \
     file://v4-0003-serial-8250_aspeed_vuart-add-aspeed-ast2600-vuart.patch \
     file://v4-0004-serial-8250_aspeed_vuart-add-VUART-over-PCI.patch \
     file://v4-0006-ARM-dts-aspeed-g6-Change-vuart-compatible-string-.patch \
     file://v4-0007-ARM-dts-aspeed-g6-add-aspeed-vuart-over-pci-prop-.patch \
     file://pcie-lpc/v2-0001-ipmi-kcs_bmc_aspeed-g6-Add-KCS-Channel-4-over-PCI.patch \
     file://pcie-lpc/v2-0002-ARM-dts-aspeed-g6-add-pcie-kcs4.patch \
    "

do_configure:prepend:kommando-ipmi-card() {
    # copy the new dts file to the dts aspeed folder
    install -m 0644 ${UNPACKDIR}/aspeed-bmc-asus-kommando-ipmi-card.dts \
        ${S}/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
}
