class OctocovRunnCoverage < Formula
  desc "Generate octocov custom metrics JSON from the output of 'runn coverage'."
  version '0.1.13'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.13/octocov-runn-coverage_v0.1.13_darwin_arm64.zip'
      sha256 'bec7d211bc4ba35367c0ee775ad82e9248f710ddf6d0f629b31fe1565c8fde74'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.13/octocov-runn-coverage_v0.1.13_darwin_amd64.zip'
      sha256 '2ee9d7ed2e7b6a89dba50788a8298d6cab09c0571c0a87cfb309a9cc22506394'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.13/octocov-runn-coverage_v0.1.13_linux_arm64.tar.gz'
      sha256 '769e42c43205a0d64952101b4571d2c15e9c27fd72861fd9dc39d7826a6b6f71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.13/octocov-runn-coverage_v0.1.13_linux_amd64.tar.gz'
      sha256 'c29c36018ca767970cd81003a5474aead7d514f8b2c3d98f7d656431864f2791'
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
