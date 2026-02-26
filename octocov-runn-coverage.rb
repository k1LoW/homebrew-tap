class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.5'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.5/octocov-runn-coverage_v0.1.5_darwin_arm64.zip'
      sha256 'a5dd7d2b0d2751e8e903e8cdca1ca140ec89c8fc0c3f852db4d77c1cb85d68ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.5/octocov-runn-coverage_v0.1.5_darwin_amd64.zip'
      sha256 '048aa495b7daf9eb8efac434005b0828e424cc41951767e7b3cee22830d36133'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.5/octocov-runn-coverage_v0.1.5_linux_arm64.tar.gz'
      sha256 '19deab7d72b8e84e5223a30121a0b442da321bc71872092a4819de935372b0a2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.5/octocov-runn-coverage_v0.1.5_linux_amd64.tar.gz'
      sha256 '8f54133bd46cd50f8c2de1192e53befae7fd9164da383c1b043eec35cabcbdff'
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
