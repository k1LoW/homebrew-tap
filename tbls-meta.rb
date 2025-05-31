class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.2'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.2/tbls-meta_v0.4.2_darwin_arm64.zip'
      sha256 '443e0d490e236a32f6493768db6bf89f463f7b707847e129bbc40bd80364ce34'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.2/tbls-meta_v0.4.2_darwin_amd64.zip'
      sha256 'a9a153ebe348fc44e633ef15596462bcec8d679cd11adf0e3d45f9a48a59eecb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.2/tbls-meta_v0.4.2_linux_arm64.tar.gz'
      sha256 '31b6157c56f9c18cd9242e1b0e37a113956ca73c497d67beba7f3e055ebc3e83'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.2/tbls-meta_v0.4.2_linux_amd64.tar.gz'
      sha256 '16b4e80bbf7d04b113cc515cffd69cfe4be0cc7e6ec1f0ccafe0d91205c24957'
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
