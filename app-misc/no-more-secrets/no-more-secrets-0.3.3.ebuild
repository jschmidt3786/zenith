# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit toolchain-funcs

EGIT_REPO_URI="https://github.com/bartobri/${PN}.git"
EGIT_COMMIT="v${PV}"
SRC_URI=""
inherit git-r3
KEYWORDS="amd64 x86"

DESCRIPTION="recreate decrypting text from 1992 movie 'Sneakers'"
HOMEPAGE="https://github.com/bartobri/no-more-secrets"

LICENSE="GPL-3"
SLOT=0

DEPEND="sys-libs/ncurses:0="

RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's#CC =#CC ?=#' Makefile
	sed -i 's#prefix =#prefix ?=#' Makefile
	sed -i 's#CFLAGS =#CFLAGS ?=#' Makefile
}

src_compile() {
	CC=$(tc-getCC) CFLAGS=${CFLAGS} emake
	CC=$(tc-getCC) CFLAGS=${CFLAGS} emake sneakers
}

src_install() {
	prefix=/usr DESTDIR="${ED}" emake install
}
