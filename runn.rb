class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.78.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.78.1/runn_v0.78.1_darwin_arm64.zip'
      sha256 '0504fbdacd653339f8c77472a265822e74d121ec26dc15f0b5d6d8626849b419'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.78.1/runn_v0.78.1_darwin_amd64.zip'
      sha256 '2daed22f6471eb3649c51a96df9a14276c7a8808e288d662189685ed1a91c72e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.78.1/runn_v0.78.1_linux_amd64.tar.gz'
      sha256 'a2fae90220815f40113a4a877b9729aba9b0f0938ef205b4b193d799be12197b'
    end
  end

  head do
    url 'https://github.com/k1LoW/runn.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'runn'
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
    (bash_completion/'runn').write output
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
    (zsh_completion/'_runn').write output
  end
end
