class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.3/octocov_v0.75.3_darwin_arm64.zip'
      sha256 'c81daedb79bfbbece7d04dee1dee626151a02036580d7d6e060f9cf45d35f2ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.3/octocov_v0.75.3_darwin_amd64.zip'
      sha256 'ea56eefc57cae4c953defc334d33563dd0eef708876156d7d2392569e71717ae'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.3/octocov_v0.75.3_linux_amd64.tar.gz'
      sha256 '8366531e94b8644febe7e6412f5c1c5504be08ab4437ba4c9662f127ad2125d2'
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
