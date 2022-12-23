class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.54.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.0/runn_v0.54.0_darwin_arm64.zip'
      sha256 'a5ddf2807e116311e4a28781580ff7895f4b0eb42ead27ab3ef884f17c2c0e9d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.0/runn_v0.54.0_darwin_amd64.zip'
      sha256 '2ed1504a7ed82ac6253f129346abaff7cc571496cf679fdd665285d1070be557'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.0/runn_v0.54.0_linux_amd64.tar.gz'
      sha256 'c071c1b02c69af9f3a8bb9686bf9ec6d0a6d601b0d530435027cdc18c7f8e4e3'
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
