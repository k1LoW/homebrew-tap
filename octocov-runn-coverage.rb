class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.1/octocov-runn-coverage_v0.1.1_darwin_arm64.zip'
      sha256 '35adbfe52d0d19442728269c2e82f91930694579b80bc306b9f0f2b9708bba0d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.1/octocov-runn-coverage_v0.1.1_darwin_amd64.zip'
      sha256 'a77bda58e16cd5f4c5b281b0f51262fd728b1f8e760e9f24b9de719497e00cff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.1/octocov-runn-coverage_v0.1.1_linux_arm64.tar.gz'
      sha256 'cca676cecaec33e76eb70543747062730ed842d2f34db3484114caa590c7a8a7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.1/octocov-runn-coverage_v0.1.1_linux_amd64.tar.gz'
      sha256 '8523611e8b444a1848dfcebeea0d3184f720311059bb42a54297db4e3f7d14bc'
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
