# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Gnome Keyring plugin for Pidgin"
HOMEPAGE="https://github.com/aebrahim/pidgin-gnome-keyring"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/aebrahim/pidgin-gnome-keyring.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=net-im/pidgin-2.10 \
		app-crypt/libsecret \
		dev-libs/glib:2"
RDEPEND="${DEPEND}"
