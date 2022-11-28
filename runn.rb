class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.51.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.51.1/runn_v0.51.1_darwin_arm64.zip'
      sha256 '2486ee337cad963572dd0fcd172ba032d92306df94cc92ea8fbb959293a5cebc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.51.1/runn_v0.51.1_darwin_amd64.zip'
      sha256 '0d6d79be358f6a521f01ee648070b0908f5b226c59824885e1c2336bde43c67f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.51.1/runn_v0.51.1_linux_amd64.tar.gz'
      sha256 'f307dd163b9f86ee7cdea8cac7ef5ee973a7f29ffc69f814d5d26a4ea39b2693'
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
