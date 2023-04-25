class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.68.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.68.1/runn_v0.68.1_darwin_arm64.zip'
      sha256 '6783c8939214022b94a15fa129779468a467a172b1c0494260da47002ddb70df'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.68.1/runn_v0.68.1_darwin_amd64.zip'
      sha256 'ccd2c8177ef42654959fe5ee608579b712a66591eb0293d3f4f0e68e73e7d165'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.68.1/runn_v0.68.1_linux_amd64.tar.gz'
      sha256 'f2993543db763f29614eaf0a11799efc35d8778fe18af2d716786ef3ec42e37b'
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
