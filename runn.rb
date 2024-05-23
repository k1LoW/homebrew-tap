class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.109.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.109.0/runn_v0.109.0_darwin_arm64.zip'
      sha256 'b564e1f1b1a969055e9aac92e5679bfe88079b1f5b21725f7d44c26407159d3a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.109.0/runn_v0.109.0_darwin_amd64.zip'
      sha256 'bfed91aa516331c4af9e390ed157e89b4830300acf4ca06e540b208928e65e28'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.109.0/runn_v0.109.0_linux_amd64.tar.gz'
      sha256 'd5ad0671c67e3c0f0a39428e21a2f8c62368a0137a216bedb81b25a7876bcce3'
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
