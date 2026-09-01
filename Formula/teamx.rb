class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.0"

  # Pre-built binaries live on the PUBLIC homebrew-tap release (the enterprise
  # source repo is private, so anonymous brew downloads point here). Tarballs
  # contain teamx-<version>/bin/teamx + LICENSE.

  on_macos do
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.0/teamx-macos-arm64.tar.gz"
      sha256 "a4c0647d001864146afde89684a73fc0862706e84f37234364421ec7f9038124"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.0/teamx-linux-x86_64.tar.gz"
      sha256 "79eca89ff307ea827f96e4bd840d46704f2beb78a91bc137f654cf6cb191268f"
    end
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.0/teamx-linux-arm64.tar.gz"
      sha256 "a63f8be838760393a1bb58fd6aa4db4010afb9e717cf6f25774950799c362c15"
    end
  end

  def install
    # Homebrew auto-chdirs into the tarball's top-level directory
    # (teamx-<version>/), so bin/teamx is relative to that.
    bin.install "bin/teamx"
  end

  test do
    assert_match "teamx", shell_output("#{bin}/teamx --version")
  end
end
