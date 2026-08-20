class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.9.5'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.5/runn_v1.9.5_darwin_arm64.zip'
      sha256 '05a9898c699f509b92c92ef6ab3c76cad99ab68134c992592e14102c96ae3381'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.5/runn_v1.9.5_darwin_amd64.zip'
      sha256 'f7abd8ebca38663754e00ac498de4a9e1c558afc4fac9cc8cea59ae08cbb182a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.5/runn_v1.9.5_linux_amd64.tar.gz'
      sha256 'a58e67103f4adeaec7424f171b957bff357240312ef7412ef8acd7ad4684c4ab'
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
