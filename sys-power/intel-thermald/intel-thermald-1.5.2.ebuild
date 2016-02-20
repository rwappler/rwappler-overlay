# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit systemd autotools git-2

DESCRIPTION="Thermal daemon for Intel architectures"
HOMEPAGE="https://01.org/linux-thermal-daemon"
EGIT_REPO_URI="https://github.com/01org/thermal_daemon.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="-systemd"
S=${WORKDIR}/thermal_daemon-${PV}

DEPEND="dev-libs/dbus-glib
	dev-libs/libxml2"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_with systemd systemdsystemunitdir $(systemd_get_unitdir))
}

src_install() {
	default
	
	dobin tools/thermald_set_pref.sh
	doinitd "${FILESDIR}/thermald"
}
