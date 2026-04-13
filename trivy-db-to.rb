class TrivyDbTo < Formula
  desc 'trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource.'
  version '2.2.7'
  homepage 'https://github.com/k1LoW/trivy-db-to'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.7/trivy-db-to_v2.2.7_darwin_arm64.zip'
      sha256 'bb0a5c8fb4779e7d1b4285d6e492c36f4669bd7f0c9d5707b4007de970d50fd7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.7/trivy-db-to_v2.2.7_darwin_amd64.zip'
      sha256 '3657defff11fe448ea215f0b23955340b51709bfbdef46cfae2fe7ff968f1c98'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.7/trivy-db-to_v2.2.7_linux_amd64.tar.gz'
      sha256 'ab204a093b43b0925a22492da9094fc28dde28acb05be114ccb641dcf87beb82'
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
