class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.77.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.77.0/runn_v0.77.0_darwin_arm64.zip'
      sha256 'ee41fa74634fab41b38d14c6053905ac4f4232d51a14165539dd915c19a86a0f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.77.0/runn_v0.77.0_darwin_amd64.zip'
      sha256 '1ccaee5107a9c7c776562dd2f1a875286126c1066e5857839f58d647589c8606'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.77.0/runn_v0.77.0_linux_amd64.tar.gz'
      sha256 'dc39500de79660eb08452539d93986f3fdcbbd95c9bda6a0b3d1ba4be3285036'
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
