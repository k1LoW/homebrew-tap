class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.72.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.72.1/octocov_v0.72.1_darwin_arm64.zip'
      sha256 '32339041ecb9fa058ea8a01d3f584468af7ce494e6cd6f64a08f338e97414b71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.72.1/octocov_v0.72.1_darwin_amd64.zip'
      sha256 '4a8aba18d5659e638565627f7f49727269a612b639d45701ed0c632c726cc10f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.72.1/octocov_v0.72.1_linux_amd64.tar.gz'
      sha256 'a633bce727db1916c9dd41270b937c9553ce05e425248e21a3ccdb3f915b5b32'
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
