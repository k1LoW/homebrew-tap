class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.53.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.4/runn_v0.53.4_darwin_arm64.zip'
      sha256 'a42cbbc0cddf12164aaaf954e964415636dd0e2fe6aed0e4e666ae6c5d3ecab0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.4/runn_v0.53.4_darwin_amd64.zip'
      sha256 'd9b24129db6b953317d7e06e529da8a41cf432350892fc3a4076e6951405a2c1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.4/runn_v0.53.4_linux_amd64.tar.gz'
      sha256 '6958585abff1b673728b180f3a5c00aacef856493cf49b62794a2de345c77db1'
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
