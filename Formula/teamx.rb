class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.3"

  # Pre-built binaries live on the PUBLIC homebrew-tap release (the enterprise
  # source repo is private, so anonymous brew downloads point here). Tarballs
  # contain teamx-<version>/bin/teamx + LICENSE.
  #
  # NOTE: the GitHub Actions release workflow is currently blocked (account
  # billing), so assets are published manually:
  #   cargo build --release --target <triple>
  #   mkdir -p pkg/teamx-<v>/bin && cp <bin> pkg/teamx-<v>/bin/teamx && cp LICENSE pkg/teamx-<v>/
  #   tar -C pkg -czf teamx-<platform>.tar.gz teamx-<v>
  #   gh release create v<v> --repo caishu97/homebrew-tap <tarballs>

  on_macos do
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.3/teamx-macos-arm64.tar.gz"
      sha256 "09a4f2256b25732ea877135e42f389294d294f5cfd1de6ee6f79f7d506d43041"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.3/teamx-linux-x86_64.tar.gz"
      sha256 "420f9f5d856881c92fbd242b5570eb6a9670d389e235c3a73e9b87167b36acb5"
    end
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.3/teamx-linux-arm64.tar.gz"
      sha256 "8886bd8c8cbe30c3deb8951be816e0460e0e9547200a12273badac5e79600e74"
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
