class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.4/octocov_v0.75.4_darwin_arm64.zip'
      sha256 '19a58f9a42971de2c88630fac962e02f8fb9491e680b3d1b29097936c244559d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.4/octocov_v0.75.4_darwin_amd64.zip'
      sha256 'd0d6e44b96978126c014ccf2a1930e9b6b109f4a274d56492cdbd311ca6b03b3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.4/octocov_v0.75.4_linux_amd64.tar.gz'
      sha256 'ac4c09f60141957d82d73da15a41c92afe0202e4a149cb110713f6ed4a73b0eb'
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
