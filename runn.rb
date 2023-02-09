class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.58.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.3/runn_v0.58.3_darwin_arm64.zip'
      sha256 '94918f71482931efc3ae562572d51905dba50af805ec5140fc2a2f320739627c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.3/runn_v0.58.3_darwin_amd64.zip'
      sha256 '1f278d26cc349cbeb262d82cee1145d0cf2dc8e72cbb78e3119096d9f0f6e5de'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.3/runn_v0.58.3_linux_amd64.tar.gz'
      sha256 '059c9925deae96584d1899d33f0b5ef9c056e4ff10a504d71152745d567385b2'
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
