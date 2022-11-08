class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.47.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.1/runn_v0.47.1_darwin_arm64.zip'
      sha256 '1296febeb237d438ebeb7881c4d6069c6d942f095009807c58b3cea94a710d8a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.1/runn_v0.47.1_darwin_amd64.zip'
      sha256 'adcd33e2451be4c09a2e27f0ee7cf5189527e268c71456ddbf9a60cfd53efed2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.1/runn_v0.47.1_linux_amd64.tar.gz'
      sha256 'a18d8aa8829ddf070e87788a6e833a258eee546a09c8652d1bee5e586eb53b5b'
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
