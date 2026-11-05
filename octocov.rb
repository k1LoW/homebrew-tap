class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.83.5'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.5/octocov_v0.83.5_darwin_arm64.zip'
      sha256 '31cee98c5c21f5c4e07a30df13456daa6bba73cc666875831f9207a73bbdc20b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.5/octocov_v0.83.5_darwin_amd64.zip'
      sha256 'f9ab2b5c6996de5005bea809046e479ed47fa6b6a7c957e41aeb40dc12e1d0ec'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.5/octocov_v0.83.5_linux_amd64.tar.gz'
      sha256 '3aa6973a8e68036b640dac6ef0c5456dda12289c7abbdaf7b919a036555d8e9c'
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
