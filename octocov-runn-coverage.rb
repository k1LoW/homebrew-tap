class OctocovRunnCoverage < Formula
  desc "Generate octocov custom metrics JSON from the output of 'runn coverage'."
  version '0.1.12'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.12/octocov-runn-coverage_v0.1.12_darwin_arm64.zip'
      sha256 'b0b68d65175a25c372ed8d264eed918cb02153e74de88606719781f47d186d0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.12/octocov-runn-coverage_v0.1.12_darwin_amd64.zip'
      sha256 'a818427ba6e51261575ccdb96a46f3933181e4fa4ba23ea824526979f8158305'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.12/octocov-runn-coverage_v0.1.12_linux_arm64.tar.gz'
      sha256 '76d2ed05c7d31eea03e2e41f875f025041f64e25c680794c33f5e074e7aae3aa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.12/octocov-runn-coverage_v0.1.12_linux_amd64.tar.gz'
      sha256 'e8f011a4a2a2befae98a4c1837dd2fb43646cd7fa43a17bfa1f637639f548ce1'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-runn-coverage.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-runn-coverage'
  end
end
