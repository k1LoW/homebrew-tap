class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.36.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.1/runn_v0.36.1_darwin_arm64.zip'
      sha256 '3ec805e9c6ec599466035663f67684ace38bdcc073dfce9f669b3849803bee16'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.1/runn_v0.36.1_darwin_amd64.zip'
      sha256 'ca7ccb45430a4d13d075fe581254ae0d0c8333b72fabb7493d7de9e899bb1c56'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.1/runn_v0.36.1_linux_amd64.tar.gz'
      sha256 '139580d62d476d1d9a428847255b64ddb356c3c29be3c2a516ac21306d2b8fb6'
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
