class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.80.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.1/runn_v0.80.1_darwin_arm64.zip'
      sha256 '4f374942aaca0f8b0a92383a1e63e4ba06bcdc329cb4ad76ee49c4ade5b7550e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.1/runn_v0.80.1_darwin_amd64.zip'
      sha256 '85dbadfc6dd14652f65d94f1c2bff0e4f31c4bdf9c30cefc79c04209082e3d93'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.1/runn_v0.80.1_linux_amd64.tar.gz'
      sha256 '6a8bd77b4722e0161060573da6dfe2428225f829c48a6a8f4ea721bda4a09b0f'
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
