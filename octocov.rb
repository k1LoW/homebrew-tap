class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.2/octocov_v0.75.2_darwin_arm64.zip'
      sha256 '8073e7c7191ec7ce3b6d51ebd1072929deb9160f597120efd52877fc295d626b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.2/octocov_v0.75.2_darwin_amd64.zip'
      sha256 '458bfb0863529190b1e039a62cd4ea24f0f0c9d54b34f9e7eb5fc3e74c2847fb'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.2/octocov_v0.75.2_linux_amd64.tar.gz'
      sha256 '7cee95f48e5e353ef6e7f692e7561e32bc43c099ad042642bb9689d3328e17ac'
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
