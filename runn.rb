class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.98.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.2/runn_v0.98.2_darwin_arm64.zip'
      sha256 'ddc897ee4b9fab7a002b5bde0aa44cb293f45a01aace4b078728d6330ee79a5c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.2/runn_v0.98.2_darwin_amd64.zip'
      sha256 'faa7a9dfe6e8850281c0d82653c213a7e8a6b45a05696298ffa8e876db26492f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.2/runn_v0.98.2_linux_amd64.tar.gz'
      sha256 'bc4fb5e008791720f023313390d174ea11e142a162b3db86b584dd242a4149b6'
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
