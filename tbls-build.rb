class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.1'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.1/tbls-build_v0.8.1_darwin_arm64.zip'
      sha256 'e71a159844b70a37a7102825158fbbfa284b7d4ff6b76f504d8711c48aabd3a2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.1/tbls-build_v0.8.1_darwin_amd64.zip'
      sha256 '69922544679b7f42c521566f37efc63ff363a28b9ef683cd98868329e5927f38'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.1/tbls-build_v0.8.1_linux_arm64.tar.gz'
      sha256 '537321c550b13cf5f1a1181a916069c45314671a32b33236395180b0becce4d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.1/tbls-build_v0.8.1_linux_amd64.tar.gz'
      sha256 '6f8c6a8ffdfeeb3926dfeb3440a3cc5488408282ff6c9baf260a58d78a87a85f'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-build.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-build'
    generate_completions_from_executable(bin/'tbls-build', 'completion')
  end
end
