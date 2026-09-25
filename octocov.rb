class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.82.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.82.0/octocov_v0.82.0_darwin_arm64.zip'
      sha256 '31f8e4a9e0b76af08888c8805e9476458a7c5869cf5193a242ed2c38f5385689'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.82.0/octocov_v0.82.0_darwin_amd64.zip'
      sha256 '7fbf0ddd605e07bfddeaae52209adca1a74fbd1eaff559c9940e24ded3750a18'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.82.0/octocov_v0.82.0_linux_amd64.tar.gz'
      sha256 '2e9d4dc3a8ca64130570e25d542ace154d6f462a1667455708baa0b4901d59f6'
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
