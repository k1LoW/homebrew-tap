class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.4.3'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.3/tbls-build_v0.4.3_darwin_arm64.zip'
      sha256 'fb55bf8f96b7831b22aee390d50b8c21b9257e36e4b8977dbd6522a2a5ec2add'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.3/tbls-build_v0.4.3_darwin_amd64.zip'
      sha256 '85c28ca9d0830a54bd9f28ec28034f29c082b0c548d48b2ac4efd9a494350865'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.3/tbls-build_v0.4.3_linux_arm64.tar.gz'
      sha256 '4b5d6a1479761f62001009b2d590e8cb556dce88f31893db299ec3a70ca6b81d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.3/tbls-build_v0.4.3_linux_amd64.tar.gz'
      sha256 '278ec0213f07961d12e7837d130d52ae27fe1168de20239bc1146a8a64e3c9ce'
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
