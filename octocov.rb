class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.73.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.73.0/octocov_v0.73.0_darwin_arm64.zip'
      sha256 '48740d10b3d3d53445643fe0babeb08014654e545ee3a8c2e900bc895dc8bf9f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.73.0/octocov_v0.73.0_darwin_amd64.zip'
      sha256 '41fe92834363cfd4fd94e6b5321985aed88c55eee087c4f52525b923711bfa8a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.73.0/octocov_v0.73.0_linux_amd64.tar.gz'
      sha256 '01141718f79fcf0b28ec5b81bb4588450831d2a1199f2a00a45671c80bd8c8dc'
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
