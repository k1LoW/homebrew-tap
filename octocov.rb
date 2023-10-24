class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.4/octocov_v0.54.4_darwin_arm64.zip'
      sha256 '7530c5010ec4ef9c54b3cd7deeb72576394dbbd0f18adf2924cadfdf8b01e9e1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.4/octocov_v0.54.4_darwin_amd64.zip'
      sha256 '80734a472ecfc4da48c787b81f883769d50d087b19450d77599f15aaa75894b8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.4/octocov_v0.54.4_linux_amd64.tar.gz'
      sha256 'c4af32a7435f7b781be255494574db47792dfc70392d36075d42fa850c11efca'
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
