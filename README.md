# tinc 1.1 for OpenWRT

## Summary

OpenWRT package for tinc 1.1

## Documentation

[tinc 1.1 Manual](https://www.tinc-vpn.org/documentation-1.1/)

## Build

### Generic Instructions

[How to Build a Single OpenWRT Package](https://wiki.openwrt.org/doc/howtobuild/single.package)

### Sample instructions

To build tinc-1.1 for OpenWRT 15.05 for Raspberry Pi 2:

```
git clone git://git.openwrt.org/15.05/openwrt.git
cd openwrt
rm -rf feeds/packages/net/tinc
git clone https://github.com/awiouy/openwrt-tinc-1.1 package/packages/tinc
./scripts/feeds install tinc
wget https://downloads.openwrt.org/chaos_calmer/15.05.1/brcm2708/bcm2709/config.diff
cp config.diff .config
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

### Raspberry Pi B+

OpenWRT 15.05.1
tinc 1.1-pre11-e44c337eae674120745f7c7c56a1a70919ff40ca

```
root@OpenWrt:~# sptps_speed
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
root@OpenWrt:~# sptps_speed
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
