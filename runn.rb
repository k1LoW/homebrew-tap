class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.136.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.136.1/runn_v0.136.1_darwin_arm64.zip'
      sha256 'f220665a0897a606d94313d9fbfecf219b975e0c1cb9fb9c595820966287c0e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.136.1/runn_v0.136.1_darwin_amd64.zip'
      sha256 'de390dffaa159aa65e44bc35997e3b35ee42b6e805026c35043b194a74f8bc5b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.136.1/runn_v0.136.1_linux_amd64.tar.gz'
      sha256 'a498ff36884761b7657534d116b9793348c8871a9fc92e4d6369cf1b4763afe8'
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
