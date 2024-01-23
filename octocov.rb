class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.56.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.1/octocov_v0.56.1_darwin_arm64.zip'
      sha256 '5c35c7c0ceee687de1af786303039743160f1f912e961d525311a23762f3d269'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.1/octocov_v0.56.1_darwin_amd64.zip'
      sha256 '364698cff8ed6319f6ac5a3d3702ba224e00897dca95aaca1f19b03292329d69'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.1/octocov_v0.56.1_linux_amd64.tar.gz'
      sha256 '69f2f0498119dd3e8288895a10c28e2612991a41436838e1b5542ca80fd2baf9'
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
