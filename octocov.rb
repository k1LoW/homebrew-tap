class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.1/octocov_v0.74.1_darwin_arm64.zip'
      sha256 'f4d5191996ebb57d2090e2707508b1e9e90a43c24004b0836e97ac680b2c4dec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.1/octocov_v0.74.1_darwin_amd64.zip'
      sha256 'd7a95e4ef9bf33a4ea3fefcc1c4ba3060cdd6d1d38777a7ab6cdad10fe668693'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.1/octocov_v0.74.1_linux_amd64.tar.gz'
      sha256 'd6668d960e4850e21203b9f4159dee6641ae03386ce3616fd2a8ccf977f82bd7'
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
