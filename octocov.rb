class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.1/octocov_v0.75.1_darwin_arm64.zip'
      sha256 'efeea037cd828493d3a51ea7621d05ec316b2addbf47ec01b2e75b40d774afd1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.1/octocov_v0.75.1_darwin_amd64.zip'
      sha256 '06d9f85e114d0867ad52422d06f0e11badc8bdb8062a2fd0404caeda10e1d735'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.1/octocov_v0.75.1_linux_amd64.tar.gz'
      sha256 'dd86c8a47d8bc7a35cfb17b59eb1b5ef05ab4f12f4c35d5075fd1cd1dd3a39f6'
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
