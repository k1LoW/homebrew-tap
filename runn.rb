class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.115.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.2/runn_v0.115.2_darwin_arm64.zip'
      sha256 'e05fc57230241480ad034a09c521b1f57d22dbc365fcb70f064ba0da0cd759d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.2/runn_v0.115.2_darwin_amd64.zip'
      sha256 'a7b92c2a05df3c693ac08fdf0b1e52b01a9e341b513bb0077390beed8d16a75a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.2/runn_v0.115.2_linux_amd64.tar.gz'
      sha256 '08bbd57ab3ff4f4fa602e72682499343d26f591ffca7d05750cf46f4a473e61c'
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
