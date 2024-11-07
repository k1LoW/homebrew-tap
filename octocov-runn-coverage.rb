class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.0.4'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.4/octocov-runn-coverage_v0.0.4_darwin_arm64.zip'
      sha256 '8e450964a4fc43b4dcaecf8a4b7eab3cb0778899d3dd3cc7e1b8fa80afbc34e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.4/octocov-runn-coverage_v0.0.4_darwin_amd64.zip'
      sha256 '4707437ac243605db6f2e43a672dbafbbd47b274e6181c274eeafff3e06c2679'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.4/octocov-runn-coverage_v0.0.4_linux_arm64.tar.gz'
      sha256 '42d7af8c718ca8cb6a27651565e18fc65c5beed63d1e2da1e2066b8589fbfb46'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.4/octocov-runn-coverage_v0.0.4_linux_amd64.tar.gz'
      sha256 '5e50979f19e50b8e5033825bfc0eb641145c990a5708964b00fe398468894050'
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
