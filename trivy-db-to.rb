class TrivyDbTo < Formula
  desc 'trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource.'
  version '2.2.11'
  homepage 'https://github.com/k1LoW/trivy-db-to'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.11/trivy-db-to_v2.2.11_darwin_arm64.zip'
      sha256 '217ec5ee473e3071dec0a67dc3d0bc09368cb99d17f513223992854681654785'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.11/trivy-db-to_v2.2.11_darwin_amd64.zip'
      sha256 'e3d1ba019222d76ad097b1eae1ada050c8fadae98ae4fc92228829d75c7ccedd'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.11/trivy-db-to_v2.2.11_linux_amd64.tar.gz'
      sha256 '2ab4489e38edfaafd746f2173bc86a6c3f00d930c9e2210e164acb1e9b924c20'
    end
  end

  head do
    url 'https://github.com/k1LoW/trivy-db-to.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'trivy-db-to'
  end
end
