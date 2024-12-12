class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.4.4'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.4/tbls-build_v0.4.4_darwin_arm64.zip'
      sha256 '307fab5e1b7138458e2916ee3f00c5a530c22297b10ed83cf37ded927378b74a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.4/tbls-build_v0.4.4_darwin_amd64.zip'
      sha256 '4b2a11e97b372c3e667650d5846dc544e22892a87e3f55c77ed5fc03c438e685'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.4/tbls-build_v0.4.4_linux_arm64.tar.gz'
      sha256 '8c0b77f266e1644e8f31e7505ff609e60728cea27c2e90cc7c589b64496d3671'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.4/tbls-build_v0.4.4_linux_amd64.tar.gz'
      sha256 '2eb0f582abfd90b19b9fde85850e846900ae538dfe7e45272a114fe4cfd301ca'
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
