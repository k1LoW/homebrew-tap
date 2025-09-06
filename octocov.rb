class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.71.5'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.5/octocov_v0.71.5_darwin_arm64.zip'
      sha256 'ea7696fff9bf1b75e9b9c095d2737ca408f31d48e7e8f3b95469ad1dd13726ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.5/octocov_v0.71.5_darwin_amd64.zip'
      sha256 'e6d2aa6c08ca4065131c41d0cf4712a821088e94c8ba1931cca8ea9ef0af7b6b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.5/octocov_v0.71.5_linux_amd64.tar.gz'
      sha256 '1502f6823fb04c5e01817b9165aba62ccfb63967175936e332487534b080aee4'
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
