class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.0/octocov_v0.62.0_darwin_arm64.zip'
      sha256 'f914ab8a2632c6b46355e7ad654f79bbf574335e0400355acc670f75861f962f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.0/octocov_v0.62.0_darwin_amd64.zip'
      sha256 '04c536082d202739e4d8c52611c56825d97843ae6410a5b062ec961ab64067af'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.0/octocov_v0.62.0_linux_amd64.tar.gz'
      sha256 'e22d94e8b8867a18cb45bf6657840869fe22d2d08105e6fdcf62571e8c897bb4'
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
