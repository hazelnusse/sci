# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A mesh and field I/O library and scientific database"
HOMEPAGE="https://wci.llnl.gov/codes/silo"
SRC_URI="https://wci.llnl.gov/codes/silo/${P}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE="hdf5 qt4 +silex"

REQUIRED_USE="silex? ( qt4 )"

RDEPEND="
	hdf5? ( sci-libs/hdf5 )
	qt4? ( dev-qt/qtgui:4 )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-qtlibs.patch"
}

src_configure() {
	econf \
		$(use_enable silex silex ) \
		$(use_with qt4 Qt-lib-dir "${EPREFIX}"/usr/lib${LIB_LOCATION_SUFFIX}/qt4 ) \
		$(use_with qt4 Qt-include-dir "${EPREFIX}"/usr/include/qt4 ) \
		$(use_with hdf5 hdf5 ${EPREFIX}"/usr/include,${EPREFIX}"/usr/lib${LIB_LOCATION_SUFFIX} )
}