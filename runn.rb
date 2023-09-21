class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.83.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.83.0/runn_v0.83.0_darwin_arm64.zip'
      sha256 '35e0fa2c14ba7d1f42a11ee94a96e8ab877cbde09b4a4b1c95f61b802ef36764'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.83.0/runn_v0.83.0_darwin_amd64.zip'
      sha256 '9b906413ef14e63b1b2e0413326607d3e7546e671a6c42607ba43ec81151cb45'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.83.0/runn_v0.83.0_linux_amd64.tar.gz'
      sha256 'd2a2c411cb97b84820537a9e988d66d9ba74c781b98665a0bd02bab953782a73'
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
