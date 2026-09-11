class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.1"

  # Pre-built binaries live on the PUBLIC homebrew-tap release (the enterprise
  # source repo is private, so anonymous brew downloads point here). Tarballs
  # contain teamx-<version>/bin/teamx + LICENSE.

  on_macos do
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.1/teamx-macos-arm64.tar.gz"
      sha256 "0d27aa6b8a50528484dfd21a0d3947af98426e9f5f1c78ba07a2b7fb2845e846"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.1/teamx-linux-x86_64.tar.gz"
      sha256 "4fca776c6cef1577e2c13bf00df4fa99f85604c1b9987ceb950bd48f1a0ee930"
    end
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.1/teamx-linux-arm64.tar.gz"
      sha256 "bf29feb2f2d9462b049ce9c081bd37a135813564f47c46bbf0b4c7caff71b0ca"
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
