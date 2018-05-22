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

# pkg_setup, src_unpack, src_prepare, src_configure, src_compile, src_test (optional, FEATURES="test"), src_install, pkg_preinst, pkg_postinst

# TODO: create user, create init script, modify startup shell script, put .jar, .config, and startup in place

#pkg_setup() {
#	riemann_create_users
#}

#src_unpack() {}
#src_prepare() {}
#src_configure() {
	#econf
#}
#src_compile() {
	#emake
#}
#src_test() {}
src_install() {
	#emake DESTDIR="${D}" install
	#einstall
	dosbin bin/riemann
	dolib lib/riemann.jar #not really a "lib"
	doinitd # need an init.d/
	doconfd # have a /etc/{default,sysconfig}/
	doenvd # probably don't need...
	insinto /etc/riemann
	newins etc/riemann.config riemann.config
}
#pkg_preinst() {}
#pkg_postinst() {}

#pkg_config() {}
