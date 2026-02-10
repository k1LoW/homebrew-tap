class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.5'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.5/octocov_v0.74.5_darwin_arm64.zip'
      sha256 'b45daed935bc8ccf536a3a1e8b69e65ed56bd2f62643f095dd30d20671bdbef0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.5/octocov_v0.74.5_darwin_amd64.zip'
      sha256 '229929b014e7a02c4e21a63880f354c1534c56a7e1deed0ce40e125cefb8155e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.5/octocov_v0.74.5_linux_amd64.tar.gz'
      sha256 'f5acb8fccc00be54138cb684cbf7a2e4129ad452b34d2f6a9a2ab22a07f7f0ab'
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
