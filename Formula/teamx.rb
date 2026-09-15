class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.4"

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
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.4/teamx-macos-arm64.tar.gz"
      sha256 "62120bacede861a2dbf7cc8bd76b13e5b38c71bab2c3f66dc93b9dfeb19cec9c"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.4/teamx-linux-x86_64.tar.gz"
      sha256 "ae452bd53ba1b9b2189691d882383abecb7a2ee2162c1b06a5efcfcc711f0455"
    end
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.4/teamx-linux-arm64.tar.gz"
      sha256 "cf7614edd7e18bb782cd4ec3dcdef3d201254c3b1b5c231051f1dd05e32388ff"
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
