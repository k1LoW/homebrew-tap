class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.55.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.2/octocov_v0.55.2_darwin_arm64.zip'
      sha256 '6d39209c59708c75b27ed72d1a87385a6bea77bf4093d7fcb8ee1158a15c5fde'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.2/octocov_v0.55.2_darwin_amd64.zip'
      sha256 '2fe78ee582aec0e2a5ca9f77aeb0367edbe4942ac85ff84bf21f609e11297864'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.2/octocov_v0.55.2_linux_amd64.tar.gz'
      sha256 '5f63ed2a382a474f8ac53c86693321707b13b79f2984c005712cdca1035337f3'
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
