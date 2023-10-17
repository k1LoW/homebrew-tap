class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.3/octocov_v0.54.3_darwin_arm64.zip'
      sha256 'e9b3c85af39e7d69b1a50720202523044b8d85f7c4ffded3332e2d31fec8cecf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.3/octocov_v0.54.3_darwin_amd64.zip'
      sha256 'b49658c515b9138ffff04f4865b598037b7e93cb84c02107d45b511b90d0221f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.3/octocov_v0.54.3_linux_amd64.tar.gz'
      sha256 '4a7d581dd3b369e91317de7adaf9d30228595a6c4eb57cb0ec80f4a735539ebe'
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
