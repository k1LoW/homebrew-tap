class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.6'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.6/octocov_v0.74.6_darwin_arm64.zip'
      sha256 '495a76e559e8c950ede5584c6aa32553ef8243212e7d456c3f7c8f1ad0ae76c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.6/octocov_v0.74.6_darwin_amd64.zip'
      sha256 '32232ea32a9c568df3357702238973f6015c5890b16a00f0977969458a69a198'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.6/octocov_v0.74.6_linux_amd64.tar.gz'
      sha256 '3d13a4bba2a9d0493eb112c840edb23f11e6106e43d7b0f7e36869a02bbeccd6'
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
