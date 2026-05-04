class TrivyDbTo < Formula
  desc 'trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource.'
  version '2.2.8'
  homepage 'https://github.com/k1LoW/trivy-db-to'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.8/trivy-db-to_v2.2.8_darwin_arm64.zip'
      sha256 '5ce0485283ee075e34ec71e6faa543e14809a3aa1dc6df4b68ef84cb443d01d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.8/trivy-db-to_v2.2.8_darwin_amd64.zip'
      sha256 '6e0ed4188667a13c960019137b9c61a527c37e1c0c67ba4bf3654f4b005b031c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.8/trivy-db-to_v2.2.8_linux_amd64.tar.gz'
      sha256 'e1d57f9f96fbd6a736b9cb2668409c30f4a0e8e19b1b6353d4511be7ffa06fbf'
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
