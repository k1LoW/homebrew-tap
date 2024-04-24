class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.59.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.3/octocov_v0.59.3_darwin_arm64.zip'
      sha256 'ebf65d76542e58b24bf2e0c3955c40938a672a5cd64413aaff8a860b7b461cb2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.3/octocov_v0.59.3_darwin_amd64.zip'
      sha256 'a137cc98a32cc3a32fc0b76aac70e619a57495ca62a917972564c25e715663b3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.3/octocov_v0.59.3_linux_amd64.tar.gz'
      sha256 'b57710f0008feeee4978456d9002146eb9a569b3511b2503e0a9fc221eb1335d'
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
