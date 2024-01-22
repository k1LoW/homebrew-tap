class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.98.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.0/runn_v0.98.0_darwin_arm64.zip'
      sha256 'f53d336b37c8d73c3c68398e1a347a1a3ff8705a5f85b14ca5f3e256d4c7a264'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.0/runn_v0.98.0_darwin_amd64.zip'
      sha256 '906f1e0768243590c0a541935455a882e670236227f01223718e3dcc92156ee6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.0/runn_v0.98.0_linux_amd64.tar.gz'
      sha256 '8e98f428d802b6c96dae81d373d52901355bd9deec3d06f344a021d52b13531d'
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
