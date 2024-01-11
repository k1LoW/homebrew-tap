class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.95.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.1/runn_v0.95.1_darwin_arm64.zip'
      sha256 '94669deac43b86815b638841b5787a23674817a5c505628aa977f3734e7ade54'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.1/runn_v0.95.1_darwin_amd64.zip'
      sha256 '01702ad879c2bbd2c58941122bb72fe59d07ce104846d27f32df12fa3a0f8839'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.1/runn_v0.95.1_linux_amd64.tar.gz'
      sha256 '74cffbac887a7b909b95c3d8ec800fe62ff6adc60f0b0d16f961c20e627f2a12'
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
