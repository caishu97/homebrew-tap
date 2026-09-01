class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.0"

  # Pre-built binaries are published to the teamx-enterprise GitHub Release.
  # Each tarball contains teamx-<version>/bin/teamx + LICENSE (see
  # .github/workflows/release.yml in the enterprise repo).

  on_macos do
    on_arm do
      url "https://github.com/caishu97/teamx-enterprise/releases/download/v0.2.0/teamx-macos-arm64.tar.gz"
      sha256 "a4c0647d001864146afde89684a73fc0862706e84f37234364421ec7f9038124"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/teamx-enterprise/releases/download/v0.2.0/teamx-linux-x86_64.tar.gz"
      sha256 "79eca89ff307ea827f96e4bd840d46704f2beb78a91bc137f654cf6cb191268f"
    end
    on_arm do
      url "https://github.com/caishu97/teamx-enterprise/releases/download/v0.2.0/teamx-linux-arm64.tar.gz"
      sha256 "a63f8be838760393a1bb58fd6aa4db4010afb9e717cf6f25774950799c362c15"
    end
  end

  def install
    # The tarball wraps everything in a teamx-<version>/ directory.
    cd "teamx-#{version}" do
      bin.install "bin/teamx"
    end
  end

  test do
    assert_match "teamx", shell_output("#{bin}/teamx --version")
  end
end
