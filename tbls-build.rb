class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.5.0/tbls-build_v0.5.0_darwin_arm64.zip'
      sha256 '4a43d1e880ea25f9331675526d0f7d6e92e529c0503367c9d8bd3298d7d43396'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.5.0/tbls-build_v0.5.0_darwin_amd64.zip'
      sha256 'ef97b0cb920682cfce7f848235000eee5353164386700cee757f59c09f195929'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.5.0/tbls-build_v0.5.0_linux_arm64.tar.gz'
      sha256 '24aa36bde3c2597626f22f762a122cde5494a50e90714131aac571ea45de2782'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.5.0/tbls-build_v0.5.0_linux_amd64.tar.gz'
      sha256 '8f4e15eb43530affdd2a513546f9ce05a49900b57c88b7adcc68a39c1bf268dd'
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
