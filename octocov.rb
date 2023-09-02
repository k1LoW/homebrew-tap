class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.51.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.1/octocov_v0.51.1_darwin_arm64.zip'
      sha256 '9a2736d1f98f3730578f28af2a7540dbc216584525ff13197f9bc903b4d9d369'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.1/octocov_v0.51.1_darwin_amd64.zip'
      sha256 '22850f58dbfaeb81859a941f05a8f4afafe52b079b5d76682a3668b87e5201c9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.1/octocov_v0.51.1_linux_amd64.tar.gz'
      sha256 'e26627d68bf673a322891c4f2ca3efa65205575f4c3bbcf6ff0252f6ba7a5d0e'
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
