class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.140.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.0/runn_v0.140.0_darwin_arm64.zip'
      sha256 '9343cd13d90e4798ecd506b435204ae8f7294f74c5329544dfaef29c5994b644'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.0/runn_v0.140.0_darwin_amd64.zip'
      sha256 'c09d39b1a79d0df47a638172bf8ff95e0509b2a68e55b28c4890f128db67aff8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.0/runn_v0.140.0_linux_amd64.tar.gz'
      sha256 'f5b22c5817aa80836ac726ed3f37194932aa0eac02984ea4411a205d716275f3'
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
