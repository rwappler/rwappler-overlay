# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

KDE_HANDBOOK="optional"
KDE_LINGUAS="bg bs ca ca@valencia cs da de el en_GB eo es et fi fr ga
gl hr hu it ja ko lt mai nb nds nl pa pl pt pt_BR ro ru sk sl sr
sr@ijekavian sr@ijekavianlatin sr@latin sv tr ug uk zh_CN zh_TW"

inherit git-r3 kde.org

DESCRIPTION="An advanced twin-panel (commander-style) file-manager for KDE with many extras"
HOMEPAGE="https://quickgit.kde.org/?p=krusader.git"
EGIT_REPO_URI="https://github.com/KDE/krusader.git"
LICENSE="GPL-2"

SLOT="5"
KEYWORDS="amd64 ~ppc x86"
IUSE="+bookmarks debug"

DEPEND="
    kde-frameworks/karchive
    kde-frameworks/kbookmarks
    kde-frameworks/kcodecs
    kde-frameworks/kcompletion
    kde-frameworks/kconfig
    kde-frameworks/kconfigwidgets
    kde-frameworks/kcoreaddons
    kde-frameworks/kguiaddons
    kde-frameworks/ki18n
    kde-frameworks/kiconthemes
    kde-frameworks/kio
    kde-frameworks/kitemviews
    kde-frameworks/kjobwidgets
    kde-frameworks/knotifications
    kde-frameworks/kparts
    kde-frameworks/kservice
    kde-frameworks/ktextwidgets
    kde-frameworks/kwallet
    kde-frameworks/kwidgetsaddons
    kde-frameworks/kwindowsystem
    kde-frameworks/kxmlgui
    kde-frameworks/solid
    dev-qt/qtdbus
    dev-qt/qtgui
    dev-qt/qtprintsupport
    dev-qt/qtwidgets
    dev-qt/qtxml
    sys-apps/acl
    sys-libs/zlib
"

RDEPEND="${DEPEND}
	sys-devel/gettext
	bookmarks? ( kde-apps/keditbookmarks )
	!kde-misc/krusader:4
"
