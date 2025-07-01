class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.86.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.86.1/tbls_v1.86.1_darwin_arm64.zip'
      sha256 '6ea220b13db9a35afa1fd14f8708213f272c2f27917cbcc9412a38799e3d6ff0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.86.1/tbls_v1.86.1_darwin_amd64.zip'
      sha256 '27687ae8772e1e80bd064c919bf3c56b16a665ff1b8c45a6953593413aec89b2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.86.1/tbls_v1.86.1_linux_arm64.tar.gz'
      sha256 '93c36a4e12b598f06b6601325fa0a8dcfde8bb8c2b5a34626bbb36754ea786a5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.86.1/tbls_v1.86.1_linux_amd64.tar.gz'
      sha256 'c11b18f38dd5d7cd5c540b4cdf3db4e4b21a7f03b5c73cddfdfab5e9acefc198'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
    system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
    bin.install 'tbls'
    bash_completion.install 'tbls.bash' => 'tbls'
    zsh_completion.install 'tbls.zsh' => '_tbls'
  end
end
