class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.105.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.105.2/runn_v0.105.2_darwin_arm64.zip'
      sha256 '1dd88ec04f950ddbbdeeb179406f7c8fe8b49c1f5969a9adf9b3bdee1646b1a7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.105.2/runn_v0.105.2_darwin_amd64.zip'
      sha256 '8b4b446876a4f1026a30a1338f5be1e072efad51e03f9f0cce8e68eb488f7115'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.105.2/runn_v0.105.2_linux_amd64.tar.gz'
      sha256 '21c15b398180623ea6c1be2e871b49f5f231433e3b836646ff04e5571097b692'
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
