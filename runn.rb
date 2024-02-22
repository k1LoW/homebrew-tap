class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.99.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.2/runn_v0.99.2_darwin_arm64.zip'
      sha256 '55d0f1bbbe2ff897b56f494a5acf16d0fc645c37a82cfde4f7dee7ad7219908e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.2/runn_v0.99.2_darwin_amd64.zip'
      sha256 '9a2447fc9920a37824d42aeb028c47a502e3a0d1423c4e8a56265784b24babb4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.2/runn_v0.99.2_linux_amd64.tar.gz'
      sha256 '6e0cead4add8ec3b06c50ee2840a5da6d0837b3e7dd7aaee147977d458d4d4fc'
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
