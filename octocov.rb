class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.66.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.66.0/octocov_v0.66.0_darwin_arm64.zip'
      sha256 '5a5406e1e6e877be5e184a9737f04d5694899abea0ae57514f3c90416bd4a656'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.66.0/octocov_v0.66.0_darwin_amd64.zip'
      sha256 '8513a69f301496bfe56c12185c76dd207ba664920f8b3d3dcec9e2cff50792d1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.66.0/octocov_v0.66.0_linux_amd64.tar.gz'
      sha256 '4cdcc0179c1f6d2fc0acaf0abacf4bf21136d746a3937c4ce61c8c7c53dd643a'
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
