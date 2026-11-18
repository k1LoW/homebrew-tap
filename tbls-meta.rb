class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.13'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.13/tbls-meta_v0.4.13_darwin_arm64.zip'
      sha256 '3081524e0588f461e16e891bea87d2020a3ff72cd5355c6646292d387e9f33f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.13/tbls-meta_v0.4.13_darwin_amd64.zip'
      sha256 '2038adb86a805afe1aa5f19fcd1a3349b429e454b0b96d3dd9a498116d28a48f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.13/tbls-meta_v0.4.13_linux_arm64.tar.gz'
      sha256 'ca71c8bcedc3cf82ea9fea9611303b88b157979cb997e4cac3d4d47dcb7b847b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.13/tbls-meta_v0.4.13_linux_amd64.tar.gz'
      sha256 '85ef137a8563d39dac92b22de20f41d8163e2aaa9f87da7ec1bafc00877d1e17'
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
