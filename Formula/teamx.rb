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
      sha256 "REPLACE_MACOS_ARM64_SHA"
    end
  end

  on_linux do
    on_x86_64 do
      url "https://github.com/caishu97/teamx-enterprise/releases/download/v0.2.0/teamx-linux-x86_64.tar.gz"
      sha256 "REPLACE_LINUX_X64_SHA"
    end
    on_arm do
      url "https://github.com/caishu97/teamx-enterprise/releases/download/v0.2.0/teamx-linux-arm64.tar.gz"
      sha256 "REPLACE_LINUX_ARM64_SHA"
    end
  end

  def install
    bin.install "bin/teamx"
  end

  test do
    assert_match "teamx", shell_output("#{bin}/teamx --version")
  end
end
