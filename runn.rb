class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.103.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.3/runn_v0.103.3_darwin_arm64.zip'
      sha256 'b205017e0044eebf7d8d69295f150d78fe728f00ea69655b9af39bdb5ce1cad0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.3/runn_v0.103.3_darwin_amd64.zip'
      sha256 '22b6b0b35813e7d958a9f604f37b36c5ae2ebfdd9fa775a382c15b18163e6532'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.3/runn_v0.103.3_linux_amd64.tar.gz'
      sha256 '9227bf58142dc41ac0e1bda8fa22c89fcaf3036411057889ba49c41fad4b4d99'
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
