# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit distutils-r1

DESCRIPTION="Boolean operations on paths"
HOMEPAGE="https://github.com/typemytype/booleanOperations"
SRC_URI="https://github.com/typemytype/booleanOperations/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
"

BDEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/fonttools-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/pyclipper-1.1.0[${PYTHON_USEDEP}]
"

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_src_prepare
}

python_test() {
	esetup.py test
}
