class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.117.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.1/runn_v0.117.1_darwin_arm64.zip'
      sha256 '7a3a12d242da4648fba07ef6e1e4f1a882c5e36d57be5a25aeafbdf9120844a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.1/runn_v0.117.1_darwin_amd64.zip'
      sha256 'e8f4e336f8b56913c5a70c18fab73f44f6030f894cec398edd54b5b5ae576b17'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.1/runn_v0.117.1_linux_amd64.tar.gz'
      sha256 '067655eb971cb547c6686ac2fb09ee7a3f6cab2ff938ae09f589372da1096718'
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
