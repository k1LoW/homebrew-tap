class TrivyDbTo < Formula
  desc 'trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource.'
  version '2.2.10'
  homepage 'https://github.com/k1LoW/trivy-db-to'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.10/trivy-db-to_v2.2.10_darwin_arm64.zip'
      sha256 '2198f51b9228077cf80aa2e3c162322c3f8a0d363807012b575381d5754969dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.10/trivy-db-to_v2.2.10_darwin_amd64.zip'
      sha256 '4b211fbe91d77303caf329e3cbec7a229b3855a7b365fb3e8396282789fe0263'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/trivy-db-to/releases/download/v2.2.10/trivy-db-to_v2.2.10_linux_amd64.tar.gz'
      sha256 '7b897c3fc089c501e6d831caa45a9a14c02fcc056e0bf4d2c0261260b4781eec'
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
