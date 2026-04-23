class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.7'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.7/octocov_v0.75.7_darwin_arm64.zip'
      sha256 '410a18515fe96fa4994c6fe45cd197a42c6e7b67fce638f17871fb7e099a41ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.7/octocov_v0.75.7_darwin_amd64.zip'
      sha256 '33d9ed21029ec21cc5b789f6f17dcb24cb7b28fc29ab81d84a61a0aff9f3d464'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.7/octocov_v0.75.7_linux_amd64.tar.gz'
      sha256 'ca8e0e000f47daac1c756d74964d884a57dcb8780885d4f701089a533afb2afd'
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
