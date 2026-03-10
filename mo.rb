class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.18.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.0/mo_v0.18.0_darwin_arm64.zip'
      sha256 '85b93d70a2fb091176a68a4b056eed4171e21c179336d4b5e8a20492ec45bec8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.0/mo_v0.18.0_darwin_amd64.zip'
      sha256 '79a30af0b9ec05457d2e28c5ddedbe59931fa88b872f6c917406336c876d9051'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.0/mo_v0.18.0_linux_arm64.tar.gz'
      sha256 'dc864bf6ea029aa39e8b10178c94b243f87d856ff2ca8846f5b350fdfb1eafac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.0/mo_v0.18.0_linux_amd64.tar.gz'
      sha256 'c4009428d6fc98a7866eb30a2846bf4b4c10644984db61a62fe603683abd67ea'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
