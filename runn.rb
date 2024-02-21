class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.99.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.0/runn_v0.99.0_darwin_arm64.zip'
      sha256 '543c1a66d1a3dabfa6c2c09ae9ea602269e7309fd0f3f76e254f438776caca6f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.0/runn_v0.99.0_darwin_amd64.zip'
      sha256 '98767846b325a20a54cc3625ba1d8c94541bafd14ddb63f59ebc304830058d9f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.0/runn_v0.99.0_linux_amd64.tar.gz'
      sha256 '3cccc2f0cf6ea1bd553ed4aa52b0bbfa01779ed335d0ef6cf1aaf7d053af187e'
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
