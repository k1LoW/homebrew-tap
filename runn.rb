class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.87.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.87.0/runn_v0.87.0_darwin_arm64.zip'
      sha256 '3cb6910c8f9ef839253643478ac430c85c523b3adc2dcaba7d78e15baaf2e56a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.87.0/runn_v0.87.0_darwin_amd64.zip'
      sha256 '3010cc4e329dc8a8a0da104059e8382934108b14aea1d28d69d7ed2dc99169ef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.87.0/runn_v0.87.0_linux_amd64.tar.gz'
      sha256 'bc98cc1a06e953767688abfb5de573f3bc13c1f36b8fe006e4bc18a913856712'
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
