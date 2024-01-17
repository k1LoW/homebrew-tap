class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.96.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.96.0/runn_v0.96.0_darwin_arm64.zip'
      sha256 '68601ee4bc2be8b03bb2f759a4959eef84ecc416e00c36e8aad84f838043a134'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.96.0/runn_v0.96.0_darwin_amd64.zip'
      sha256 'b163d6c922277111dc8c2a5f3feed69eddc2d118bc33f83035361bb8ba18baec'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.96.0/runn_v0.96.0_linux_amd64.tar.gz'
      sha256 '9abe0d46141c22a74fd136694a66e009f2cb34f30b94b361a6767c3bd36b2071'
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
