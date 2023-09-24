class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.52.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.1/octocov_v0.52.1_darwin_arm64.zip'
      sha256 '6c3f6386a07004b15b6d004639f6fb83434141d58c8c0f49da07736ceee5d283'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.1/octocov_v0.52.1_darwin_amd64.zip'
      sha256 '153c1e889f93f4f63b4ae075d45db9088bf99a12a2b543f5fe9b7bf559bd808f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.1/octocov_v0.52.1_linux_amd64.tar.gz'
      sha256 'da69a93b04ff8c7cd16892216ea6c20b5b0254c5a62d313a092db9c0dae87f95'
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
