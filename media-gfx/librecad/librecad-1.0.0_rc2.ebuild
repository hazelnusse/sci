# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit qt4-r2

DESCRIPTION="An generic 2D CAD program"
HOMEPAGE="http://www.librecad.org/"
SRC_URI="https://nodeload.github.com/LibreCAD/LibreCAD/zipball/1.0.0rc2 -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc"

RDEPEND="
	x11-libs/qt-gui[qt3support]
	x11-libs/qt-assistant:4
	x11-libs/qt-qt3support:4"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	mv * ${P}
}

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gcc4.6.patch
}

src_install() {
	dobin unix/librecad || die
	insinto /usr/share/"${PN}"
	doins -r unix/resources/* || die
	if use doc ; then
		dohtml -r support/doc/*
	fi
	doicon res/main/"${PN}".png
	make_desktop_entry "${PN}" LibreCAD "${PN}.png" Graphics
}