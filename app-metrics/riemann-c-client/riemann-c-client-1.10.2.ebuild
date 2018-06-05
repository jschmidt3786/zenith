# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 eutils

DESCRIPTION="a C client library for Riemann"
HOMEPAGE="https://github.com/algernon/riemann-c-client"
EGIT_REPO_URI="https://github.com/algernon/riemann-c-client.git"
EGIT_COMMIT="${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="json tls"

RDEPEND="
tls? ( >=net-libs/gnutls-2.8 )
json? ( dev-libs/json-c )"

DEPEND="${RDEPEND}
sys-devel/libtool
dev-libs/protobuf-c"

src_prepare(){
autoreconf -i
eapply_user
}
