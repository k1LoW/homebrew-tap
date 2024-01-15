class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.0.2'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.2/octocov-runn-coverage_v0.0.2_darwin_arm64.zip'
      sha256 'fa12b411cfd4a7cf8dc4392d4947e1735d120e7c5c3e4dfb3b2d952589a4b9fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.2/octocov-runn-coverage_v0.0.2_darwin_amd64.zip'
      sha256 '4624e441e6347004e08e609ea608c197e3d6b058ec977d41d0db6e7176f6f62d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.2/octocov-runn-coverage_v0.0.2_linux_arm64.tar.gz'
      sha256 '972172dbb42732fb6e4d71b8e4f0f943307d8a9caaf138770daacf4724cecf3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.2/octocov-runn-coverage_v0.0.2_linux_amd64.tar.gz'
      sha256 'acb8031a56513c5a87541c6d666dbf3deccc798168f9f20b56109dfa1e0e2a76'
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
