class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.0/tbls-meta_v0.3.0_darwin_arm64.zip'
      sha256 '57a621ee685b2364b58c91e1f4106c0ff40f45b95dedcd4fd2f835fd30d84853'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.0/tbls-meta_v0.3.0_darwin_amd64.zip'
      sha256 '384bace788df4fef84656ca1225ef954a8f6bbf633396ff7d56aff2f277b3f51'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.0/tbls-meta_v0.3.0_linux_arm64.tar.gz'
      sha256 '34189092a311672478693ba2753d127d579fde4fc59fdd881bf2b85965ea4fd4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.0/tbls-meta_v0.3.0_linux_amd64.tar.gz'
      sha256 'b8133892dacbc1527476d4c1a90cbebf220b5b1b73328177c347a3c25c7fc3a2'
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
    generate_completions_from_executable(bin/'tbls-meta', 'completion', shells: %i[bash zsh])
  end
end
