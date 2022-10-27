class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.43.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.43.0/runn_v0.43.0_darwin_arm64.zip'
      sha256 'da672ece863f87668334afe50b8f8735ce5a5e879cb195efacdadde0259e4057'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.43.0/runn_v0.43.0_darwin_amd64.zip'
      sha256 '6b8843e6a06db1ae2affd2ec89bad534f704b905a65ddccf0ded9ffa31590c54'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.43.0/runn_v0.43.0_linux_amd64.tar.gz'
      sha256 '2839a02703e95a19b5457d7534854277d1fe4a9bb8ff269735592070c801d3e8'
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
