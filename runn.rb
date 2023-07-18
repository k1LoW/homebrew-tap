class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.76.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.1/runn_v0.76.1_darwin_arm64.zip'
      sha256 '0d7fed3c5addcf3a4911a935439a6bba001366a93379b081b6f1a7d39f0bad66'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.1/runn_v0.76.1_darwin_amd64.zip'
      sha256 'bb0282c1b4ac4d0942dc76fd41589641552f9cee95049e76117f00f9ddb2cd17'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.1/runn_v0.76.1_linux_amd64.tar.gz'
      sha256 '0f1c462ff838512116b5e6c0a6c91b03b075a6d6d7de50dc1a491b5be0441217'
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
