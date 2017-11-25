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
EGIT_REPO_URI="https://github.com/KDE/krusader.git"
LICENSE="GPL-2"

SLOT="5"
KEYWORDS="amd64 ~ppc x86"
IUSE="+bookmarks debug"

DEPEND="
    $(add_frameworks_dep karchive)
    $(add_frameworks_dep kbookmarks)
    $(add_frameworks_dep kcodecs)
    $(add_frameworks_dep kcompletion)
    $(add_frameworks_dep kconfig)
    $(add_frameworks_dep kconfigwidgets)
    $(add_frameworks_dep kcoreaddons)
    $(add_frameworks_dep kguiaddons)
    $(add_frameworks_dep ki18n)
    $(add_frameworks_dep kiconthemes)
    $(add_frameworks_dep kio)
    $(add_frameworks_dep kitemviews)
    $(add_frameworks_dep kjobwidgets)
    $(add_frameworks_dep knotifications)
    $(add_frameworks_dep kparts)
    $(add_frameworks_dep kservice)
    $(add_frameworks_dep ktextwidgets)
    $(add_frameworks_dep kwallet)
    $(add_frameworks_dep kwidgetsaddons)
    $(add_frameworks_dep kwindowsystem)
    $(add_frameworks_dep kxmlgui)
    $(add_frameworks_dep solid)
    $(add_qt_dep qtdbus)
    $(add_qt_dep qtgui)
    $(add_qt_dep qtprintsupport)
    $(add_qt_dep qtwidgets)
    $(add_qt_dep qtxml)
    sys-apps/acl
    sys-libs/zlib
"

RDEPEND="${DEPEND}
	sys-devel/gettext
	bookmarks? ( $(add_kdeapps_dep keditbookmarks) )
	!kde-misc/krusader:4
"
