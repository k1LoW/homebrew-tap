class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.57.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.2/runn_v0.57.2_darwin_arm64.zip'
      sha256 '0b9ffc7304c304a28e3358cf7808495b92bc7a83b98c9946fa695129463f85b3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.2/runn_v0.57.2_darwin_amd64.zip'
      sha256 'a4c6622f3439269cfc769e8239c3ef9fd4ffc5412c2b3c7c734ccdc42b5b4575'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.2/runn_v0.57.2_linux_amd64.tar.gz'
      sha256 '14061dccfdf73f246c86ba9d3dd944458842c79dec1f447b06d9e491880d92d9'
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
