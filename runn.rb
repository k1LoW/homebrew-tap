class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.6.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.0/runn_v1.6.0_darwin_arm64.zip'
      sha256 '6ed4c78c55b3896a0839652c7cf63217518e1e80fc4dfe124108db3143514cc8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.0/runn_v1.6.0_darwin_amd64.zip'
      sha256 '4f61cd2627ac931597468667a44a1e76ea210707a53c2c2f44aa8901ca119f75'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.0/runn_v1.6.0_linux_amd64.tar.gz'
      sha256 '3c75e6dd29849c49a99dd3cf7709460bed9bc5eb10d0bb0ca21eab7d79ae22ae'
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
