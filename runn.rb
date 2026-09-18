class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.11.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.0/runn_v1.11.0_darwin_arm64.zip'
      sha256 '93506bb40caced899f3d098ed836d1ded5397eaac9c4d7b5141d04ca1721a053'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.0/runn_v1.11.0_darwin_amd64.zip'
      sha256 '15b9f4b95144968c09ef3e54469e31e5fd0f7499ad3670c848ed38ec109b31a1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.0/runn_v1.11.0_linux_amd64.tar.gz'
      sha256 '8a37939b2f41cbcab66df1e49c55d56b4759149566cf146e08fe8da40b3d9ebf'
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
