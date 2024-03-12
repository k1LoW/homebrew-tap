class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.59.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.0/octocov_v0.59.0_darwin_arm64.zip'
      sha256 '3daccfbdb02b5435ebd0368acbc2855a119757eeb88f238f6abf671f70d243ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.0/octocov_v0.59.0_darwin_amd64.zip'
      sha256 'ae5eb38b6d6365dae81acad708f99b3a9b623b9fc2a32e1b212fceaf31512332'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.0/octocov_v0.59.0_linux_amd64.tar.gz'
      sha256 '14214bf3ffb193cdd3bdd733309dabbef81ccdac476be162cc34d50dec095d70'
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
