class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.68.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.2/octocov_v0.68.2_darwin_arm64.zip'
      sha256 '428fb334a07396f467632a9a52c39ddec6557fed05b3f99561fc34083912e1fd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.2/octocov_v0.68.2_darwin_amd64.zip'
      sha256 'ac612ab03731a0323fcea270692fa3a021c13088aaa3ed051b7103e963003029'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.2/octocov_v0.68.2_linux_amd64.tar.gz'
      sha256 'bba4cd76c1b921355177796e01562ad5a0ee748b43f22060592e209afed092fd'
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
