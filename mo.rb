class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.4'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.4/mo_v1.6.4_darwin_arm64.zip'
      sha256 '4e996990bdb54fee23d9a247b12889b65d8d50ef7cec2f00cab7eb699adb55c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.4/mo_v1.6.4_darwin_amd64.zip'
      sha256 'a71b7e33ce8de4287999edfe4199f90819f8b8546e2c7925ccb106c1270dfc43'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.4/mo_v1.6.4_linux_arm64.tar.gz'
      sha256 'b23f9cf5e6c1f302efa97f9998dba86f5c18a73537af2102b1b1e71e5075862e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.4/mo_v1.6.4_linux_amd64.tar.gz'
      sha256 '9e508f83b1412001d56dcdb32c5ed53ab06e31db8a4830753344fd32ce02cb4b'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
