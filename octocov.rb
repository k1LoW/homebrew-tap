class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.63.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.63.0/octocov_v0.63.0_darwin_arm64.zip'
      sha256 '0a8d231d639d465018b0e52cf2f0c789d2210b5f6ffd4457236c77f12360eec4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.63.0/octocov_v0.63.0_darwin_amd64.zip'
      sha256 '0779b156a82bbb5a5eaf7030fc1c5ef9f7162b9d5098ed9ace334949d201142a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.63.0/octocov_v0.63.0_linux_amd64.tar.gz'
      sha256 '4d70b490fb906aeac3c0a144d38a4e28c04727aafd96fe4358c266d3beb5b3b8'
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
