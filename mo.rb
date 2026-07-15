class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.5'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.5/mo_v1.6.5_darwin_arm64.zip'
      sha256 '23a09f7d49d2883efe5759257d31e4775dd04ac104bbee05fa8616ab336f3941'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.5/mo_v1.6.5_darwin_amd64.zip'
      sha256 'c7c40f91524e6c0d496fdfdd823db2a4960023804960a4a4d0259fc908291a57'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.5/mo_v1.6.5_linux_arm64.tar.gz'
      sha256 '1680029c5a577f9eb3b438fbfef51a1b918a787c6277ee125528c0187976c67b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.5/mo_v1.6.5_linux_amd64.tar.gz'
      sha256 '9a8049db5ae4291038f679f60a2a1d16ba741616bb93ad550d80751095a68380'
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
