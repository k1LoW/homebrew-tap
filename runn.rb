class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.104.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.1/runn_v0.104.1_darwin_arm64.zip'
      sha256 '9611e850eb246ebf685efbb75ed7416d5a85ce35e101993197a3995ca0475333'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.1/runn_v0.104.1_darwin_amd64.zip'
      sha256 '82e3be1ba06fe018f5ccba226f9d3864d5840240f698f8334c40bf93a88c3f4e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.1/runn_v0.104.1_linux_amd64.tar.gz'
      sha256 'afc69b0b4e0dacd8dfe599e76c49e2d46a30959b229cd9ef07dc2a2bfc68b894'
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
