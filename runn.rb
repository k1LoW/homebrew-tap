class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.59.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.2/runn_v0.59.2_darwin_arm64.zip'
      sha256 '7afc87be383e3166f0fb8ecd1ec4c408b4cb7c8f179e7071f966c44b92085c23'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.2/runn_v0.59.2_darwin_amd64.zip'
      sha256 'e7c6334f68a947fe3405048ea451016895ae2f885b9c2127d23aba8c18b9966a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.2/runn_v0.59.2_linux_amd64.tar.gz'
      sha256 '6cd69d0b8c93ab9e03cfa04e833dbf9d84afbb7bf9a06d6262aa9c37c1fa7adf'
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
