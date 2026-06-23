class TrivyDbTo < Formula
  desc 'trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource.'
  version '2.2.9'
  homepage 'https://github.com/k1LoW/trivy-db-to'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.9/trivy-db-to_v2.2.9_darwin_arm64.zip'
      sha256 '7d603fa2d9105531da8a7ac57d6533a4c43ed8e149c67de50835ceecedd5eb4e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.9/trivy-db-to_v2.2.9_darwin_amd64.zip'
      sha256 '2fe8d647a8a626dcc8db49a69f7240424f123f4b37ae916ed38a9eebaa173651'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.9/trivy-db-to_v2.2.9_linux_amd64.tar.gz'
      sha256 '35f0f65ae034404cfcdcc5a60d110c910d09556715dd2b427b92fef2eea89e84'
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
