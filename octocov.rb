class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.65.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.1/octocov_v0.65.1_darwin_arm64.zip'
      sha256 '07ac23b021806536c7a98d34e52733414fd8d0c809019955561097262f58fe6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.1/octocov_v0.65.1_darwin_amd64.zip'
      sha256 '7a17a544a7ac68667b4cfd667ac7714e5892f502a70c22b41e2bc0b30ef48caa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.1/octocov_v0.65.1_linux_amd64.tar.gz'
      sha256 'a6702c0cd4f03163791cc4ac6a87cd5e6080e4b1fedf5c334b0031e1fe14beb6'
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
