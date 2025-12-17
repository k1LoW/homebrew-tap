class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.4'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.4/tbls-meta_v0.4.4_darwin_arm64.zip'
      sha256 'fd72758629041fd2d7a660f15fd682e6b4cb5bbcaf4989126a7d6770073edad0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.4/tbls-meta_v0.4.4_darwin_amd64.zip'
      sha256 'ce9d25f105e4423a774e7d0995e095cce3d0397b16a863325cff4a459bb4a2f5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.4/tbls-meta_v0.4.4_linux_arm64.tar.gz'
      sha256 '3a589ce55dd5afdee419b11355fa98332924ba7468a0bf4dad3d25bf3c34e328'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.4/tbls-meta_v0.4.4_linux_amd64.tar.gz'
      sha256 'd4b98117eaad8c8007f8a275c4a334b03328f3af0b92e3a808c64915c3d826c1'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-meta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-meta'
    generate_completions_from_executable(bin/'tbls-meta', 'completion')
  end
end
