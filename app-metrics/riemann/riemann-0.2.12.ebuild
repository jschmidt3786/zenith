# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="Riemann monitors distributed systems"
HOMEPAGE="http://riemann.io/"
EGIT_REPO_URI="https://github.com/riemann/riemann.git"

if [[ ${PV} == "999" ]] ; then
	echo "using HEAD"
else
	EGIT_COMMIT="${PV}"
fi
#https://github.com/riemann/riemann/releases/download/0.3.0/riemann-0.3.0.tar.bz2
#https://github.com/riemann/riemann/releases/download/${PV}/${P}.tar.bz2

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
		dev-java/icedtea-bin
"
RDEPEND="${DEPEND}"
