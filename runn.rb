class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.37.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.3/runn_v0.37.3_darwin_arm64.zip'
      sha256 '4604ce56310a0f5c5840bf36776d281c81a3e28b26931a0ad1d81d28b6574f50'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.3/runn_v0.37.3_darwin_amd64.zip'
      sha256 '1c9214cbf3705107102dda17bf1739f6b261a1a8b2b8535cecc3a539b50334b8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.3/runn_v0.37.3_linux_amd64.tar.gz'
      sha256 'ddbdc4b92af6b06378a87217d5d7aa5e995893c5ace5014c5db8d0ed047cf0f6'
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
