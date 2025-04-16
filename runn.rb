class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.129.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.4/runn_v0.129.4_darwin_arm64.zip'
      sha256 '78591a3cc162560eb5a5d16f3b8c3dfa8878ed81339e092f1a232d77eda09f0d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.4/runn_v0.129.4_darwin_amd64.zip'
      sha256 'cbfa9c00fe5ef411bfce72cd650b6a0cbc9fabb139aeaa5c5f0dc62a974fef49'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.4/runn_v0.129.4_linux_amd64.tar.gz'
      sha256 '2e4bda6d2a90a596194d4b1855f5324d94bff7038dbeb899324fb6bdb8a4b5b5'
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
