# tinc 1.1-pre15 for OpenWRT
Since I couldn't figure out if there was a better/more right way to build sptps-speed with the openWrt tinc package
I opted to clone the tag [release-1.1pre15](http://tinc-vpn.org/git/browse?p=tinc;a=commit;h=refs/tags/release-1.1pre15)
and change the Makefile to also build sptps-speed since it is set to [not automatically build](http://tinc-vpn.org/git/browse?p=tinc;a=commit;h=d3cc96b027a919e22bbf06d634edb0a2a069ac92)

## Summary

OpenWRT package for tinc 1.1-pre15 with sptps-speed

## Documentation

[tinc 1.1 Manual](https://www.tinc-vpn.org/documentation-1.1/)

## Build

### Generic Instructions

[How to Build a Single OpenWRT Package](https://wiki.openwrt.org/doc/howtobuild/single.package)

### Sample instructions

To build tinc-1.1 for OpenWrt/LEDE-project

```
git clone https://github.com/lede-project/source.git
cd lede-project
rm -rf feeds/packages/net/tinc
git clone https://github.com/excogitation/openwrt-tinc-1.1.git
./scripts/feeds install tinc
make defconfig 
make package/tinc/compile
```

## Install

### Sample Instructions

To install tinc-1.1 for OpenWRT 15.05 for Raspberry Pi:

```
scp bin/brcm2708/packages/base/tinc_1.1-pre11-*_brcm2708.ipk root@openwrt:.
ssh root@openwrt
opkg update
opkg install tinc_1.1-pre11-*_brcm2708.ipk
```

## sptps_speed
1.1-pre15
###GL.iNet 6416 (Atheros AR9331)
Generating keys for 10 seconds:            228.18 op/s
Ed25519 sign for 10 seconds:               208.34 op/s
Ed25519 verify for 10 seconds:              75.60 op/s
ECDH for 10 seconds:                        59.19 op/s
SPTPS/TCP authenticate for 10 seconds:      27.75 op/s
SPTPS/TCP transmit for 10 seconds:          24.78 Mbit/s
SPTPS/UDP authenticate for 10 seconds:      27.74 op/s
SPTPS/UDP transmit for 10 seconds:          24.98 Mbit/s

### Archer C7 (QCA9558)
Generating keys for 10 seconds:            531.17 op/s
Ed25519 sign for 10 seconds:               497.37 op/s
Ed25519 verify for 10 seconds:             181.63 op/s
ECDH for 10 seconds:                       140.99 op/s
SPTPS/TCP authenticate for 10 seconds:      65.69 op/s
SPTPS/TCP transmit for 10 seconds:          64.76 Mbit/s
SPTPS/UDP authenticate for 10 seconds:      65.66 op/s
SPTPS/UDP transmit for 10 seconds:          65.35 Mbit/s

From 1.1-pre11

### Raspberry Pi B+

OpenWRT 15.05.1
tinc 1.1-pre11-e44c337eae674120745f7c7c56a1a70919ff40ca

```
Generating keys for 10 seconds:            674.06 op/s
Ed25519 sign for 10 seconds:               606.45 op/s
Ed25519 verify for 10 seconds:             262.35 op/s
ECDH for 10 seconds:                       193.71 op/s
SPTPS/TCP authenticate for 10 seconds:      85.23 op/s
SPTPS/TCP transmit for 10 seconds:          82.22 Mbit/s
SPTPS/UDP authenticate for 10 seconds:      85.45 op/s
SPTPS/UDP transmit for 10 seconds:          82.89 Mbit/s
```

### Raspberry Pi 2

OpenWRT 15.05.1
tinc 1.1-pre11-e44c337eae674120745f7c7c56a1a70919ff40ca

```
Generating keys for 10 seconds:            953.27 op/s
Ed25519 sign for 10 seconds:               857.97 op/s
Ed25519 verify for 10 seconds:             353.00 op/s
ECDH for 10 seconds:                       263.65 op/s
SPTPS/TCP authenticate for 10 seconds:     117.96 op/s
SPTPS/TCP transmit for 10 seconds:          98.49 Mbit/s
SPTPS/UDP authenticate for 10 seconds:     118.08 op/s
SPTPS/UDP transmit for 10 seconds:          99.17 Mbit/s
```

### Raspberry Pi 3

OpenWRT r49096
tinc 1.1-pre11-e44c337eae674120745f7c7c56a1a70919ff40ca

```
Generating keys for 10 seconds:           1012.15 op/s
Ed25519 sign for 10 seconds:               922.64 op/s
Ed25519 verify for 10 seconds:             367.24 op/s
ECDH for 10 seconds:                       279.53 op/s
SPTPS/TCP authenticate for 10 seconds:     125.81 op/s
SPTPS/TCP transmit for 10 seconds:         148.28 Mbit/s
SPTPS/UDP authenticate for 10 seconds:     125.85 op/s
SPTPS/UDP transmit for 10 seconds:         149.26 Mbit/s
```
