class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.112.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.3/runn_v0.112.3_darwin_arm64.zip'
      sha256 '75ee240800fd43b3dcf23ba9147b9e2d454b0a4f28a425a74c1140417da66bec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.3/runn_v0.112.3_darwin_amd64.zip'
      sha256 'c6c909b94ee6b8ffc9e15c740c9001766d8d4621f580cb408a7bb4fff14fb643'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.3/runn_v0.112.3_linux_amd64.tar.gz'
      sha256 '583c15c60bb0d889d160ee699e79abef2457443717229f1a4e5035c9fe7520cc'
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
