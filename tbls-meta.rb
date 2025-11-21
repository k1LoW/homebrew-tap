class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.3'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.3/tbls-meta_v0.4.3_darwin_arm64.zip'
      sha256 '676da812c3e7bb398c663666efa64b5c25aee852262228ef8082e0cb0006d570'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.3/tbls-meta_v0.4.3_darwin_amd64.zip'
      sha256 '850f9e9540470d3e27a75ba27860a302c74e751a62b4dc342fde082bbd879bfb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.3/tbls-meta_v0.4.3_linux_arm64.tar.gz'
      sha256 '4ad2f9f259b1579dc8aaa03ed5222da5577730f4c5e5573a3a15cf5af6b5dd44'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.3/tbls-meta_v0.4.3_linux_amd64.tar.gz'
      sha256 'daecaf3d4d7abcb58d5e826b221872dee67613062d788e332b8fa8d621105d23'
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
