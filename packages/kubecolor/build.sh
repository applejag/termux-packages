TERMUX_PKG_HOMEPAGE=https://github.com/kubecolor/kubecolor
TERMUX_PKG_DESCRIPTION="Colorize your kubectl output"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Kalle Fagerberg"
TERMUX_PKG_VERSION="0.2.2"
TERMUX_PKG_SRCURL=https://github.com/kubecolor/kubecolor/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ba0894a8e26fefff47a0691529964303bdd8fdc2d7ce74e7d241cb5a2f2ade50
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="kubectl"

termux_step_make() {
	termux_setup_golang
	cd "$TERMUX_PKG_SRCDIR"

	go build -o kubecolor -ldflags "-X main.Version=${TERMUX_PKG_VERSION}"
}

termux_step_make_install() {
	install -Dm700 ${TERMUX_PKG_SRCDIR}/kubecolor \
		$TERMUX_PREFIX/bin/kubecolor
}
