class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.54.5'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.5/runn_v0.54.5_darwin_arm64.zip'
      sha256 'efd700913b149ea0daa28151b39841cf1d3eef5e9f44ebf97135a8e21c5b6cf2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.5/runn_v0.54.5_darwin_amd64.zip'
      sha256 '1b834c479e63f488260349731039b00a6713442525189e184c81c05294bd923e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.5/runn_v0.54.5_linux_amd64.tar.gz'
      sha256 '85cb6c711b1f49e8b266603d26fcc755a594f37b1fcba98d4e3c7cccaa25ac97'
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
