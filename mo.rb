class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.3.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.3.0/mo_v1.3.0_darwin_arm64.zip'
      sha256 'e1cad0e3201dcb32315d2b6d0458ed23e91ffe61a8e5dff762d8f38bda6e3d2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.3.0/mo_v1.3.0_darwin_amd64.zip'
      sha256 '0ece2a855c15e81a3f000697906ae347ebe0725b74ff04b605294ae3f823ce52'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.3.0/mo_v1.3.0_linux_arm64.tar.gz'
      sha256 '32dee8cf011e4ad8f6be7aa2c7aaf5ea34eba303decdb4f6ddd27ad5992ea485'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.3.0/mo_v1.3.0_linux_amd64.tar.gz'
      sha256 '0499fbc8e99dd8895beb7049a382dafca0864f1336f31168b4a1b02f4f516313'
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
