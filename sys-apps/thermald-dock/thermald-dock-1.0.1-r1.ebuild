# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Dock application for controlling intel-thermald profiles."
HOMEPAGE="https://github.com/rwappler/thermald-dock"
SRC_URI="https://github.com/rwappler/thermald-dock/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="=dev-qt/qtgui-4.8*
	=dev-qt/qtdbus-4.8*
	=dev-qt/qtcore-4.8*"
RDEPEND="${DEPEND}
	|| ( sys-power/intel-thermald sys-power/thermald )"

