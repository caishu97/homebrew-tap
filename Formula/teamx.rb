class Teamx < Formula
  desc "teamx - shared-goal team collaboration state kernel"
  homepage "https://github.com/caishu97/teamx-enterprise"
  version "0.2.6"

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
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.6/teamx-macos-arm64.tar.gz"
      sha256 "309999f4aef679401b72e636f42b7fec537b88ddbc517012c289df712eb0e50a"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.6/teamx-linux-x86_64.tar.gz"
      sha256 "b8fc73423b65c4ba91fbd242a9c3b552c6de5dd6d22bdc148fe803b1ea5c4d41"
    end
    on_arm do
      url "https://github.com/caishu97/homebrew-tap/releases/download/v0.2.6/teamx-linux-arm64.tar.gz"
      sha256 "cd994c57c1289f70aafe2b9c8817b6f7a7450f6852ea804f02646b3edcc495bb"
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
