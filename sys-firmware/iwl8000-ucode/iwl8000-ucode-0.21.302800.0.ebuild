# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit linux-info versionator

DEV_N="${PN:3:4}"
vc=($(get_all_version_components "${PV}"))
MY_PV="${vc[2]}.${vc[4]}.${vc[0]}"
MY_PN="iwlwifi-${DEV_N}-ucode"

# Linux Firmware Version, see also sys-kernel/linux-firmware
MY_LFPV="20161205"
MY_LFPN="linux-firmware"
MY_LFP="${MY_LFPN}-${MY_LFPV}"

DESCRIPTION="Firmware for Intel (R) Dual Band Wireless-AC ${DEV_N}"
HOMEPAGE="https://wireless.kernel.org/en/users/Drivers/iwlwifi"

IUSE="bluetooth"

SRC_URI="mirror://gentoo/${MY_LFP}.tar.xz"

LICENSE="ipw3945"
SLOT="${vc[2]}"
KEYWORDS="~amd64 ~x86"


DEPEND=""
RDEPEND="!sys-kernel/linux-firmware[-savedconfig]"

S="${WORKDIR}/${MY_LFP}"

pkg_pretend() {
	if kernel_is lt "${DV_MAJOR}" "${DV_MINOR}" "${DV_PATCH}"; then
		ewarn "Your kernel version is ${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}."
		ewarn "This microcode image requires a kernel >= ${DV_MAJOR}.${DV_MINOR}.${DV_PATCH}."
		ewarn "For kernel versions < ${DV_MAJOR}.${DV_MINOR}.${DV_PATCH}, you may install older SLOTS"
	fi
}

src_unpack() {
	default

	mv ${WORKDIR}/${MY_LFPN}-* ${S}
}

pkg_setup() {
	CONFIG_CHECK="${CONFIG_CHECK} ~IWLMVM"
	ERROR_IWLMVM="CONFIG_IWLMVM is required to be enabled in /usr/src/linux/.config for the kernel to be able to load the ${DEV_N} firmware"

	if use bluetooth; then
		CONFIG_CHECK="${CONFIG_CHECK} ~BT_INTEL"
		ERROR_BT_INTEL="CONFIG_BT_INTEL is required to be enabled in /usr/src/linux/.config for the kernel to be able to load the firmware for the bluetooth module of the ${DEV_N} firmware"
	fi

	linux-info_pkg_setup
}

src_install() {
	insinto /lib/firmware
	doins "${S}/iwlwifi-${DEV_N}C-${vc[2]}.ucode"

	if use bluetooth; then
		insinto /lib/firmware/intel
		doins "${S}/intel/ibt-12-16.sfi"
		doins "${S}/intel/ibt-12-16.ddc"
	fi;
	dodoc README*
}
