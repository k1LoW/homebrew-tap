class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.7'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.7/octocov-runn-coverage_v0.1.7_darwin_arm64.zip'
      sha256 '498902f0717314c066938f5edd7d9115d8851f49dbafc880739d8470531931c1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.7/octocov-runn-coverage_v0.1.7_darwin_amd64.zip'
      sha256 '1e055f0df02b20e11fe5fec0c701a0a8e42615b4f4f7dcf0945fe91924320ec5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.7/octocov-runn-coverage_v0.1.7_linux_arm64.tar.gz'
      sha256 'b120f13d30da30b7eb05db164765d796ada8b8fe6a25312ab1ce0fec208eaddf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.7/octocov-runn-coverage_v0.1.7_linux_amd64.tar.gz'
      sha256 '3dc822055df1c8eec2e1608b9ac4460106b8a486d5c9597bf8d1647412b68efa'
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
