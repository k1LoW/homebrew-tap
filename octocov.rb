class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.12'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.12/octocov_v0.75.12_darwin_arm64.zip'
      sha256 '155787f7593278664999349156183c8322ea097a8fca024b6ddfbc41143c408f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.12/octocov_v0.75.12_darwin_amd64.zip'
      sha256 'e2979103bb4157fbcb3bb85d7b1e07fc84473c0a2fba293d891054bc9a1f982e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.12/octocov_v0.75.12_linux_amd64.tar.gz'
      sha256 '258d6b348c81213b5c47b024a582b101b9dfc21ae19aaca9aea1e4b947274462'
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
