class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.103.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.0/runn_v0.103.0_darwin_arm64.zip'
      sha256 '18ca2ff481c24d450d0f6ba81304af2d58fabfb28492dc9069233d04d11446be'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.0/runn_v0.103.0_darwin_amd64.zip'
      sha256 '42d067f0ed1945c8ce72c1d6c663a4c47ab9bdab2ac1cd1bacf8788fcdb8f567'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.0/runn_v0.103.0_linux_amd64.tar.gz'
      sha256 '212a868850bfe77249d462028910aca3da386672e21e9fa1e7d8eac2f2d20901'
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
