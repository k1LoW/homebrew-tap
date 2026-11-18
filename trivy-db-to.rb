class TrivyDbTo < Formula
  desc 'trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource.'
  version '2.2.12'
  homepage 'https://github.com/k1LoW/trivy-db-to'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.12/trivy-db-to_v2.2.12_darwin_arm64.zip'
      sha256 '98f42ef344e8f8740ddac3a3c2778e1b7d6bdaafdfffa0ce3cd148ff0126f942'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.12/trivy-db-to_v2.2.12_darwin_amd64.zip'
      sha256 'dd4b9e9d35b8acd8736d8528a3cbb9d484a5227d95c2c863c22310edf81b292a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.12/trivy-db-to_v2.2.12_linux_amd64.tar.gz'
      sha256 '46cd81c47573f77d0f94abe39c8b8344f9d766d769faab295833cf63f603e80f'
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
