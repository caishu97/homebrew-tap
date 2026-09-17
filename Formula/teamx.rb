class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.5"

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
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.5/teamx-macos-arm64.tar.gz"
      sha256 "b595b2e549495b6faa253b9f407dadb409f924aec4c128bf23c878d9dd1250a2"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.5/teamx-linux-x86_64.tar.gz"
      sha256 "e5e631cdd9e4ea2937b27da4410caf1cb1c96b78c423ca20145a327429bec4bd"
    end
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.5/teamx-linux-arm64.tar.gz"
      sha256 "0242b836a9a80af9156a984a3fbfd928c0ee44c1e743df939dbe1b6eaed8eef1"
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
