# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit python-r1

PLUGINS="autodocktools bhtree cadd cmolkit dejavu geomutils gle mglutil molkit
	networkeditor opengltk pmv pyautodock pybabel pyglf qslimlib scenario2 sff
	support symserv utpackages viewer-framework vision visionlib volume
	webservices"

DESCRIPTION="Software to visualization and analysis of molecular structures"
HOMEPAGE="http://mgltools.scripps.edu/"
SRC_URI="http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL${PV}/${PN}_source_${PV}.tar.gz"

LICENSE="MGLTOOLS"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"/${PN}_source_${PV/_/}

for plug in ${PLUGINS}; do
	PLUG_DEP="${PLUG_DEP} =sci-chemistry/mgltools-${plug}-${PV}*[${PYTHON_USEDEP}]"
done

RDEPEND="${PLUG_DEP}
	dev-lang/tk
	sci-libs/msms
	dev-python/pmw[${PYTHON_USEDEP}]
	dev-python/simpy
	dev-python/imaging[tk]
	dev-python/numpy"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/share/${PN}
	doins -r Data
}