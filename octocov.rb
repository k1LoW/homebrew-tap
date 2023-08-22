class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.50.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.50.1/octocov_v0.50.1_darwin_arm64.zip'
      sha256 '33391f30d68b6743308484776287c7d9598906f6cd3584c5330e877f2728aa90'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.50.1/octocov_v0.50.1_darwin_amd64.zip'
      sha256 'd811847acc5b4055562d6a024c08f0acfb2dbbb07d481987a43b4806db56d461'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.50.1/octocov_v0.50.1_linux_amd64.tar.gz'
      sha256 '57a863fc38734e8fa5ff8185e76634f4ec046ee3a9f4cb7a9affa3e3f5e95ffa'
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
