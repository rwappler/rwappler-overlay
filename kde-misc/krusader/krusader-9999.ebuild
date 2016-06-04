# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_HANDBOOK="optional"
KDE_LINGUAS="bg bs ca ca@valencia cs da de el en_GB eo es et fi fr ga
gl hr hu it ja ko lt mai nb nds nl pa pl pt pt_BR ro ru sk sl sr
sr@ijekavian sr@ijekavianlatin sr@latin sv tr ug uk zh_CN zh_TW"

inherit git-r3 kde5

DESCRIPTION="An advanced twin-panel (commander-style) file-manager for KDE with many extras"
HOMEPAGE="https://quickgit.kde.org/?p=krusader.git"
EGIT_REPO_URI="git://anongit.kde.org/krusader.git"
LICENSE="GPL-2"

SLOT="5"
KEYWORDS="amd64 ~ppc x86"
IUSE="+bookmarks debug"

#KDE_APPS_MINIMAL="15.08.03"
RDEPEND="
	$(add_kdeapps_dep plasma-runtime '' ${KDE_APPS_MINIMAL} 4)
	$(add_plasma_dep plasma-workspace '' ${PLASMA_MINIMAL})
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtxml)
	$(add_qt_dep qtcore)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtprintsupport)
	sys-libs/zlib
	bookmarks? ( $(add_kdeapps_dep keditbookmarks '' ${KDE_APPS_MINIMAL} 4) )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

# PATCHES=( "${FILESDIR}/${P}-new-folder.patch" )

# S="${WORKDIR}/${MY_P}"
