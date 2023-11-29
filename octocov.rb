class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.55.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.0/octocov_v0.55.0_darwin_arm64.zip'
      sha256 'e7a57e4350d76c2bd0461db70f0d443f76f80a2dd11ff4543110db9271d53721'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.0/octocov_v0.55.0_darwin_amd64.zip'
      sha256 '1e2ee9b7cfcb1676b30c7b726c4714896dc9133bbb7ab333c92b716b4d078471'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.0/octocov_v0.55.0_linux_amd64.tar.gz'
      sha256 '500f00c6b62a40eaf2566975c45e9e10c31e5651a6feb08e458318b42c02b910'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov'
    generate_completions_from_executable(bin/'octocov', 'completion')
  end
end
